# OVERSIGHT — Definition of Sellable & Audit Protocol

Owner: Vineet (final authority, human safety reviewer).
Auditor: Claude Code (reviews every Antigravity batch against this doc).
Builder: Antigravity (executes ANTIGRAVITY_HANDOFF.md; has no authority to
change gates, approve images, or mark items below as done).

## A. Release gates — the app is sellable only when ALL are green

### G1. Engine — ✅ GREEN (audited 2026-06-10, commit 70a520e)
36 tests passing, analyze clean, compliance greps clean, safety-critical code
(voice privacy, cast gate, paywall routing) human+Claude reviewed.

### G2. Content library — 🔴 RED
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

## D. Audit log
| # | Date | Commits audited | Verdict | Notes |
|---|------|-----------------|---------|-------|
| 0 | 2026-06-10 | …–70a520e | PASS | Baseline: engine complete (FV-001–008), 36 tests, 2 content packages, handoff issued. G1 green; G2–G5 open. |
