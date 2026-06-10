# ANTIGRAVITY HANDOFF PROMPT — Full Volume Stories

Paste everything below this line into Google Antigravity as the task prompt.

---

You are continuing development of **Full Volume Stories**, a paid cross-platform
(Flutter, Android + iOS) illustrated children's story app.
Repo: `buildpod/full-volume-stories`, branch `master`, latest commit `217feb2`.
Local path: `/Users/vineetpathak/Documents/New project/AntiGravity/full_volume_stories`.

## What the app is

Dual-mode, equal weighting:
- **Mode A** = neurodivergent / social stories (low-arousal, firstThen template, coping cards)
- **Mode B** = general kids' narrative stories (warm, narrative template, no coping cards)

## Current state — DO NOT rebuild any of this

Engine is feature-complete, FV-001 through FV-008 all committed and pushed,
**36 tests passing**, `flutter analyze` clean:
- Domain models + pack loader + cast safety gate (`lib/domain/`, `lib/services/pack_loader.dart`)
- Design tokens + two theme variants (`lib/design/tokens.dart`, `fv_theme.dart`)
- Mode selector, Home (save/filter/voice search), Settings, Parent Gate
- Story Player with TTS, coping cards, parent-gated "what your child practised" summary
- Voice trigger (STT, no audio/transcript ever persisted — NFR-3)
- Story save + PDF export (FV-006), IAP paywall with free-sample gating (FV-007)
- Learning layer: CopingCard model, learningGoal field (FV-008)

Content already authored (read these for format before writing anything):
- `content/when_the_world_gets_loud/` — complete Mode A package (script, character
  sheet, locked style block, 8 image prompts, pack.json)
- `content/the_elephants_and_the_mice/` — complete Mode B Panchatantra package
- `content/PANCHATANTRA_STORY_BANK.md` — 6 more fables outlined + house rules

## HARD RULES — never violate

1. **Child-safety gate:** every generated image goes to `/review_queue/` for HUMAN
   review. Images only ship after `cast_manifest.json` marks the cast id
   `approved: true`. `validateStoryCast()` enforces this in code. Never bypass it,
   never mark anything approved yourself.
2. **Image generation is build-time only** — Gemini 3 Pro Image (Nano Banana Pro),
   NEVER runtime/on-device in front of a child.
3. `grep -rn "Color(0xFF" lib/ | grep -v "lib/design/tokens.dart"` must return nothing.
4. `grep -rn "package:flutter" lib/domain/` must return nothing (also no comments
   containing that string).
5. `flutter analyze` exits 0; `flutter test` all pass — before every commit.
6. Small sequential tasks, one commit each (`FV-00x ...` or `content: ...` message),
   push on success, **STOP and report the raw error on any failure**.
7. No new dependencies beyond what is in `pubspec.yaml`.
8. Story adaptations must be bloodless and child-safe: no death, weapons, hunters or
   people on-screen, no genuine menace; antagonists are outsmarted, never harmed.
9. All story text: 8 pages, one clear read-aloud sentence per page, ages 3–6,
   moral lands naturally in the last 1–2 pages, never preachy.

## YOUR TASKS, in order

### Task 1 — Build out the fable library to 10 Mode B stories
"The Elephants and the Mice" is story 1 of 10. Create 9 more complete story
packages under `content/<snake_case_title>/`, each with exactly the same two files
and structure as `content/the_elephants_and_the_mice/`:
- `STORY_PACKAGE.md`: intent + learningGoal, one-off character sheets, the LOCKED
  STYLE BLOCK copied **verbatim** from the elephants package (only the setting line
  may vary slightly), 8 per-page Scene prompts, review checklist, cast_manifest
  entries, wiring steps.
- `pack.json`: conforms to the schema in `lib/domain/models.dart`
  (`mode: "general"`, `template: "narrative"`, `lowArousal: false`, no copingCards,
  unique pack id/sku/story id, full-path `imageAsset` like
  `assets/packs/images/<prefix>_01_*.png`, 4–6 voiceKeywords, castIds matching the
  character sheets). Validate each pack.json parses and meets these constraints
  before committing.

Use the 6 fables already outlined in `content/PANCHATANTRA_STORY_BANK.md` (apply
their safety-softening notes exactly), then add 3 more child-safe Indian fables of
your choosing (Panchatantra / Jataka / Hitopadesha), updating the story bank table
to match. One commit per story package.

### Task 2 — cast_manifest reader (code, FV-009)
Replace the hardcoded `{'boy': true}` approval maps in `lib/screens/home.dart` with
approvals loaded from a bundled `assets/cast_manifest.json`
(shape: `{"<castId>": {"approved": bool, ...}}`). Pure parsing logic goes in
`lib/domain/` (no Flutter imports); loading goes in `lib/services/`. Missing cast id
= not approved. Ship a manifest with `boy: approved true` (its two images exist in
`/review_queue/` pending review) and every new fable cast `approved: false`.
Add tests. Run all checks, commit as `FV-009 ...`.

### Task 3 — Multi-pack library loading (code, FV-010)
`home.dart` currently loads only `assets/packs/sample_neuro.json`. Make the home
screen load every `*.json` pack under `assets/packs/` (use the AssetManifest),
filter stories by the active app mode, and keep the existing free-sample rule
(first story of the FIRST pack is the free sample; everything else premium).
Skip — do not crash on — any pack whose cast is unapproved; surface skipped packs
in debug logs only. Add tests. Commit as `FV-010 ...`.

### Task 4 — Generate images (build-time, human gate)
For the two fully authored packages (`when_the_world_gets_loud`, then
`the_elephants_and_the_mice`): run each of the 8 prompts (LOCKED STYLE BLOCK +
CHARACTER sheet(s) + Scene line, exactly as written in the package md) through
Gemini 3 Pro Image at 1024×1024, and save outputs to `/review_queue/` with the exact
filenames from pack.json. Then **STOP and ask the human to review** against the
checklist in each package. Do not move images into `assets/`, do not edit
`cast_manifest.json` approvals, do not wire packs into `pubspec.yaml` until the
human confirms approval in writing.

### Out of scope — do not touch
Store/IAP console setup, replacing TTS with recorded voice, Gemini
commercial-terms / SynthID / C2PA disclosure verification (human launch tasks),
and anything marked locked above.

Work sequentially. After each task, report: what changed, test count, commit hash.
