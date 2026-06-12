# Voice + Launch Brief — Full Volume Stories

Two things remain between "6 illustrated stories" and "app in the stores":
**(1) replace robotic TTS with a warm narration voice**, and **(2) the launch
tax** (store accounts, IAP, legal, build/submit). This doc is self-contained so
you can drive it with ChatGPT mobile, Gemini, or Antigravity — and it marks
clearly what is **human-only** (accounts, money, signing, store submission).

---

## PART 1 — Paste into ChatGPT / Gemini to choose a voice tool

```
I'm building a PAID, cross-platform (Flutter, iOS + Android) illustrated
children's story app for ages 3-6. Two modes: calm social-stories for
neurodivergent kids, and general narrated fables. I need to choose a
text-to-speech / AI-voice tool to narrate the stories.

Hard requirements:
- VERY warm, gentle, human-sounding narration suitable for ages 3-6 (robotic
  voices are a dealbreaker). A calm storyteller tone.
- COMMERCIAL license that explicitly permits use in a PAID app I sell.
- BATCH generation at BUILD TIME: I render one short audio clip per page
  (one sentence each, ~8 per story, ~10-15 stories = ~100-150 clips) and
  bundle the audio files in the app. NOT live/on-device TTS in front of a child.
- Export to standard audio files (mp3 or wav) I can drop into the app.
- Ideally an API or batch UI so I'm not recording 150 clips by hand.
- Nice to have: multiple distinct narrator voices, and English + German + Hindi.
- I'm a solo developer; tell me the realistic monthly/one-off cost for ~150
  short clips, and whether a free/cheap tier covers it.

Please compare the top 4-5 options (e.g. ElevenLabs, OpenAI TTS, Google Cloud
TTS, Azure Neural TTS, PlayHT, or hiring a human VO on Fiverr/Voices.com) in a
table on: voice warmth for kids, commercial-license clarity for a paid app,
batch workflow, file export, multilingual, and cost. Then give ONE clear
recommendation for my exact use case and the 3 steps to produce my first test
clip. Note any that FORBID resale/paid-app use in their license.
```

### My (Claude's) shortlist so you're not flying blind
- **ElevenLabs** — best warmth/quality, clear commercial tiers, batch API,
  multilingual. Likely winner for "premium feel." Check per-character pricing.
- **Azure Neural TTS** — very natural, child-friendly voices, strong commercial
  terms, cheap at this volume.
- **Google Cloud TTS (Studio/Chirp voices)** — fits your existing Gemini setup;
  commercial-safe; solid but slightly less "storyteller-warm" than ElevenLabs.
- **OpenAI TTS (gpt-4o-mini-tts)** — cheap, easy, steerable tone, commercial OK;
  fewer distinct "characterful" voices.
- **Human VO (Fiverr/Voices.com)** — the truly premium option for a curated
  launch set; ~$ per finished minute. Best for the free-sample stories at least.
> Whatever you pick, **read the license line about reselling / paid apps** and
> save a screenshot of it — it's a store-compliance item.

---

## PART 2 — Engineering change to USE the audio (give to Antigravity)

```
FV-016: Pre-recorded narration playback.
Currently the Story Player narrates via flutter_tts. Add support for bundled
per-page audio, falling back to TTS when a clip is absent.
- domain/models.dart: add optional `String? audioAsset` to StoryPage
  (parse json['audioAsset'] as String?; default null; keep all existing tests
  passing — field is optional/back-compatible).
- pubspec.yaml: add audioplayers (or just_audio) — ONE audio dependency only.
- story_player.dart: if page.audioAsset != null, play that bundled file on the
  play button; else fall back to existing _tts.speak(page.text). Keep the calm-
  mode no-autoplay rule. Dispose the player.
- Register assets/packs/audio/ in pubspec.
- Add a test: a StoryPage with audioAsset set selects the audio path
  (mock/seam the player); a page without it uses the TTS path.
- grep checks (no Color(0xFF outside tokens, no package:flutter in lib/domain),
  flutter analyze 0, flutter test all pass. Commit FV-016, push, HALT.
```
Then: drop your generated clips into `assets/packs/audio/` named to match each
story (e.g. `loud_p1.mp3`), and add the `audioAsset` paths to each pack.json.

---

## PART 3 — Finish the content (Antigravity, proven loop)
Remaining authored fables needing images (8 each, one story per batch, audit
between): **Three Fish, Brahmin's Dream, Musical Donkey, Mice that Ate Iron,
Wise Quail.** Plus 2 more Mode A stories are planned for mode balance.
Use the standard image directive (verbatim style block + character sheets +
addendum → /review_queue/ → human/auditor review → cast_manifest).

---

## PART 4 — Launch tax (the deploy steps)

### Can be done by an AI agent (Antigravity) or with AI help:
- App icon + store screenshots (generate, then you approve).
- Store listing copy — **lead with the neurodivergent / social-stories angle**;
  that's the searchable wedge. (ChatGPT/Gemini can draft this.)
- Privacy policy text (mic/STT explained, nothing persisted, no kid analytics)
  — AI can draft; you host it at a URL.
- Release build config, `flutter build appbundle` / `flutter build ipa`.
- Fix the gitignored-images issue for CI builds (images live on disk only;
  ensure your build machine has assets/packs/images + audio present, or remove
  them from .gitignore for the release branch).

### HUMAN-ONLY — no AI (not ChatGPT, not Gemini, not Antigravity) can do these:
- **Apple Developer account** ($99/yr) and **Google Play Console** ($25 once).
- **Signing keys / certificates** (keep these secret; never paste to any AI).
- **Configure the IAP product** `full_volume_premium` in both consoles, then
  **sandbox-test purchase + restore on real devices.**
- **Submit for review** and complete the Kids-category / Families questionnaires
  and Data Safety forms.
- **Verify Gemini image commercial terms + SynthID/C2PA disclosure** are OK for
  a paid kids' app (legal-ish; verify directly, don't take an AI's word).

---

## Role split going forward
- **ChatGPT/Gemini mobile:** voice-tool research, listing/privacy copy, general
  Q&A. Cheap, fine for non-safety work.
- **Antigravity:** code (FV-016), image batches, build commands.
- **Claude (auditor):** low-frequency final gate — pre-screen new images,
  spot-check that audio clips match page text and the license permits paid use,
  confirm safety invariants before any store build. Come back for the
  pre-submission audit.
- **You:** every store/account/payment/signing/legal step above, and the
  voice-tool decision.
```
