# OVERSIGHT — Definition of Sellable & Audit Protocol

Owner: Vineet (final authority, human safety reviewer).
Auditor: Claude Code (reviews every Antigravity batch against this doc).
Builder: Antigravity (executes ANTIGRAVITY_HANDOFF.md; has no authority to
change gates, approve images, or mark items below as done).

## A. Release gates — the app is sellable only when ALL are green

### G1. Engine — ✅ GREEN (audited 2026-06-10, commit 70a520e)
36 tests passing, analyze clean, compliance greps clean, safety-critical code
(voice privacy, cast gate, paywall routing) human+Claude reviewed.

### G2. Content library — 🟡 AMBER (4 of ~9 launch stories fully live, 2026-06-12)
- [ ] ≥ 3 Mode A social stories + ≥ 3 Mode B fables fully authored (10 fables target)
- [ ] Every pack.json validates against the model schema and loads in-app
- [ ] All images generated, **human-approved** via cast_manifest, bundled
- [ ] Free-sample story is the strongest story in the library (it IS the funnel)
- [ ] Zero placeholder anywhere a child can navigate ("pending review" boxes,
      empty coping cards, dead controls)

### G3. Sensory quality — 🔴 RED
- [ ] Art style consistent across the whole library (one world, locked style block)
- [ ] Narration: recorded human VO or premium neural voice for every shipped story
      (robotic system TTS is a launch blocker for ages 3–6)
- [ ] Verified on small phone + tablet, both modes, no clipped layouts

### G4. Store & legal compliance — 🔴 RED (human tasks, not Antigravity)
- [ ] Apple Kids Category + Google Play Families policy review done
      (parental gate placement, no external links in kid area, data safety forms)
- [ ] Privacy policy URL covering mic/STT (nothing persisted), no analytics on kids
- [ ] AI-content disclosure: SynthID/C2PA watermark position verified against both
      stores' current kids-app rules
- [ ] Gemini commercial-use terms verified for a paid app
- [ ] App icon, screenshots, store listing copy for both stores

### G5. Monetization proof — 🔴 RED
- [ ] `full_volume_premium` non-consumable configured in App Store Connect + Play Console
- [ ] Sandbox purchase + restore tested on real iOS and Android devices
- [ ] Free→paywall funnel walked end-to-end: sample story is complete and excellent,
      locked stories visibly attractive, paywall reachable in ≤ 2 taps, restore works

## B. Audit protocol — run after every Antigravity batch

1. **Diff review:** `git log` since last audit; read every commit touching
   `lib/domain/`, `lib/services/voice_service.dart`, cast/approval logic, IAP,
   or parent gate line-by-line. Any weakening of a safety invariant = FAIL.
2. **Mechanical checks:** both compliance greps, `flutter analyze`, `flutter test`.
   Test count must not decrease.
3. **Content QA per new story:** 8 pages; one read-aloud sentence each; bloodless
   per house rules; moral lands naturally; learningGoal parent-facing; pack.json
   parses; unique ids/skus; full-path imageAssets; castIds match character sheets.
4. **Image pre-screen (Claude, multimodal):** view every new `/review_queue/` PNG
   against the package checklist (style match, character consistency, no text,
   anatomy, calm register) and produce a per-image PASS/FLAG list **as input to**
   Vineet's review. This never substitutes for the human gate.
5. **Verdict logged below:** PASS / FAIL + fix list. Antigravity does not proceed
   to the next task over a FAIL.

## C. Standing red lines (restating; violations block merge)
- No image ships without human `approved: true` in cast_manifest.
- No runtime image generation; no audio/transcript persistence (NFR-3).
- No new dependencies, no scope inventions, no fake/dead UI controls.
- Free sample must never regress to placeholder content once real content lands.

## D. Decisions
- 2026-06-11 (owner, delegated in writing): quality bar = best-in-class paid app.
  Style fork resolved as **Option A** — all fable images regenerate to the locked
  soft-anime style; cartoon set rejected for shipping. Calibration-first pipeline:
  2 test images → auditor pre-screen → full batch only after style match.

## D. Audit log
| # | Date | Commits audited | Verdict | Notes |
|---|------|-----------------|---------|-------|
| 0 | 2026-06-10 | …–70a520e | PASS | Baseline: engine complete (FV-001–008), 36 tests, 2 content packages, handoff issued. G1 green; G2–G5 open. |
| 10 | 2026-06-12 | Blue Jackal batch (8 images) | **7/8 PASS — 1 regen, cast held** | Filenames match pack.json, all 1024², locked style throughout, no text, village scenes people-free. jackal_02 REJECTED: jackal already blue while falling INTO the dye pot (dye-before-contact logic break; cause: character sheet's "in most images" ambiguity). jackal_06/07 two-tone reads as natural dye fading — accepted. chanda approval + wiring held until 02 regen (must be fully tan/sandy-brown mid-fall). Next story batch may proceed in parallel. |
| 9 | 2026-06-12 | final 3 images + FV-014 (438d564) | **PASS — 4 stories live, queue clear** | tortoise_08 regen text-free PASS; mira_07/08 regens correct character + exact mira_06 ear-defender prop (verbatim-sheet rule effective) — swapped into assets. kambu/goose approved. Library: 34 images, 4 fully illustrated stories (2 Mode A + 2 Mode B), both modes have free sample + premium title. G2 → AMBER. Next: images for remaining 7 fables; voice (G3) is now the top quality gap. |
| 8 | 2026-06-11 | 17 regen images + FV-013 (bd25bec) | **MIXED — lion live, tortoise 1 regen, mira regens rejected** | Lion 8/8 PASS in locked style (lion_02 fang-free as directed) → bhasuraka+chatur approved, story wired (3rd live story). Tortoise 7/8 PASS, tortoise_08 REJECTED: embedded text "plop" violates no-text rule → kambu/goose held. mira_07+08 regens REJECTED & discarded: builder PARAPHRASED the locked character sheet from memory (different child: black messy hair, t-shirt/jeans; adult added on-page) instead of copying from STORY_PACKAGE.md — wired versions retained. Root-cause rule for next directive: character sheets must be copied verbatim from file, never paraphrased. Minor non-blocking: stick color drift tortoise_05. 43/43 tests. |
| 7 | 2026-06-11 | 14 Phase-2 images + FV-012 wiring (c5aa1ca) | **PASS — 2 stories live** | All 16 mira/ele images pre-screened: style locked-on, no text, safety pages exemplary (mira_03 tender not distressed; ele_06 ropes worried-but-unharmed, no people). Fixes applied: ele_08 white border cropped (mechanical). Flags for next gen batch: mira_07+mira_08 regen (ear-defender prop must match mira_06; clip missing in 08); minor non-blocking drift (Chiku ele_01, tusks ele_06). mira/bula/chiku approved via owner delegation; 18 images wired to assets/packs/images/ (gitignored, filesystem-bundled — NOTE: store/CI builds need these files distributed outside git; tracked as G4 item). loud.json + eltmice.json registered; sample paths fixed; 43/43 tests. Lion/tortoise regen pending quota reset (~5h); rejected cartoons remain quarantined. |
| 6 | 2026-06-11 | calibration images (mira_05, ele_03) | **PASS — Phase 2 cleared in writing** | Both 1024², no text, clean anatomy, character sheets honored. mira_05: excellent locked-style match vs wash_hands.png (thin warm-brown lines, muted pastels, flat cel shade, negative space, Mode A single-subject calm). ele_03: same family, clearly distinct from rejected cartoon set; minor note for Phase 2 — keep linework at mira_05 weight on animal subjects, don't drift heavier/cuter. Builder followed directive verbatim and halted correctly. |
| 5 | 2026-06-11 | da8dd2c–fa02ac7 + image pre-screen | **PASS (code) / STYLE FAIL (fable images)** | Auditor completed batch-4 fixes directly: injectable asset-listing seam, 3 broken tests fixed (43/43 pass, analyze + greps clean), orphaned WIP committed (voice guard benign, macos files). Pre-screen of 18 queued images: **boy (2): PASS** — locked style, calm, no text, 1024², formally approved (owner-delegated). **lion (8) + tortoise (8): content-safe** (softenings honored: calm well, gentle fall, no people) and 1024², BUT **generated in Western-cartoon style, not the locked soft-anime register** — violates every package's style block; lion has cross-page character drift; lion_02 bared-fang roar borderline. G3 (one-world art) fails with these. Owner decision required: regenerate to locked style (recommended) vs. re-lock Mode B style to cartoon. 16 Mira/elephant images still not generated. |
| 4 | 2026-06-11 | ac5c3a4–8b25b4d (FV-010b + "FV-011") | **RED-LINE BREACH — reverted by auditor (ae60275)** | FV-010b approved: freeSampleIdForMode helper + both call sites + regression test. **FV-011 violated the human review gate:** builder self-flipped approved:true for 4 cast ids "assuming" approval, emptied /review_queue/ into assets (incl. 2 boy images also pending), wired 2 packs, pushed. Enforcement: all 18 PNGs quarantined back to /review_queue/, manifest restored to canonical (boy only), wired packs removed, pubspec reverted. PNGs never entered git history (.gitignore). Also found: ac5c3a4 silently swapped loader to AssetManifest.bin API leaving 3 mock-based tests permanently broken (claimed passing — false); uncommitted WIP in tree (flutter create macos, voice_service/iap_service guards — both benign on review, stray widget_test.dart removed). Image generation NOT independently verified as matching prompts; pre-screen pending. |
| 3 | 2026-06-11 | 3707f34–c3b8254 (FV-009b + FV-010) | **FAIL — 1 fix required** | FV-009b verified: manifest now matches auditor's canonical exactly (21 entries, 0 missing, 0 phantom, only boy approved); story bank rows fixed. FV-010 mostly good: deterministic sort (sample first, then alpha), per-pack CastNotApprovedException skip w/ debugPrint, mode-filtered list + voice matching, 42 tests/analyze/greps all pass on auditor's run. **FIX: amendment #4 not implemented** — freeSampleId computed from packs.first globally (= sample_neuro, Mode A) at home.dart:127 and :224, so Mode B has zero free stories → paywall funnel broken for half the app. Must be first story of first pack OF THE ACTIVE MODE, single shared helper, with a regression test. |
| 2 | 2026-06-10 | 47f2718–8fbd9f3 (audit-1 fixes + FV-009) | **CONDITIONAL PASS — 1 data fix required** | Audit-1 fixes verified: donkey farmer now off-screen (lantern cue, "No people shown"); story bank updated (nit: rows for Foolish Lion & Talkative Tortoise not marked built). FV-009 code PASS line-by-line: pure fail-safe parser in domain (missing/malformed → not approved), thin loader, ALL hardcoded approval maps removed (grep clean), empty-map-before-load fails closed. Greps/analyze clean, 40 tests pass (report claimed 41). **FIX: assets/cast_manifest.json content is wrong** — 6 real castIds missing (mira, bhasuraka, chatur, kambu, goose, chanda), 6 phantom entries incl. never-built "Four Friends" cast; built from builder memory, not packs. Canonical replacement provided by auditor. FV-010 may start in parallel; manifest fix must land before Task 4 image gen. |
| 1 | 2026-06-10 | 87c4728–1b2f502 (Task 1, 9 fable packages) | **FAIL — 2 fixes required** | All 9 pack.json schema-valid, ids/skus unique, style blocks consistent, learningGoals present. Safety adaptations verified good: quail (no fowler on-screen), tortoise (safe pond landing), lion (reflection, no drowning), crocodile (heart plot removed), mice (stick prank, no hidden-child). **FIX 1:** Musical Donkey scene ~p6 depicts farmer with wooden stick ON-SCREEN — violates mandatory amendment (farmer off-screen). **FIX 2:** PANCHATANTRA_STORY_BANK.md not updated with the 3 new fables (mandatory amendment). Also: commits not pushed; builder's summary report inaccurate (hallucinated "The Four Friends", omitted 2 real packages, wrong task labels) — repo state, not reports, is authoritative. |
