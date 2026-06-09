# Story Package — "When the World Gets Loud"

**Mode:** A (neurodivergent / social story) · **Template:** firstThen · **Pages:** 8
**Pack id:** `pack_loud` · **SKU:** `sku_loud_001` · **Cast id:** `mira`
**Intended use:** Premium library story (and a strong candidate for the free-sample slot).

This is a complete, ready-to-produce package: story script, character sheet,
locked style block, eight paste-ready image prompts, the matching pack JSON
(`pack.json` in this folder), and the human-review + wiring steps required by the
child-safety gate.

> **How this flows through Antigravity:** paste each prompt below into your
> Antigravity image-generation step (Gemini 3 Pro Image / "Nano Banana Pro"),
> generate **build-time only**, and write every output into `/review_queue/`.
> Nothing reaches a child until it passes the checklist and `cast_manifest.json`
> marks `mira` as `approved: true`.

---

## 1. Story intent (why this story exists)

A social story that teaches a child to **notice sensory overload in their body
and self-regulate** — the single most-requested scenario from parents of
autistic and sensory-sensitive kids. Arc: calm → trigger (it gets loud) →
interoception (noticing the body signal) → coping breath → coping tool (ear
defenders) → recovery → mastery. First/then structure throughout, low-arousal
art, one calming-breath coping card.

**learningGoal (parent summary, shown after the story):**
> "Noticing when sounds feel too big, and using slow breaths and a quiet helper
> to feel calm again."

---

## 2. Character sheet — "Mira" (one-off, this pack only)

> Paste this block into **every** scene prompt unchanged. One-off character:
> she only needs to be consistent **within** this pack, not across other stories.

```
CHARACTER "Mira" (keep identical in every image):
A gentle 5-year-old girl. Soft round face, warm light-brown skin, rosy cheeks,
a few faint freckles. Short dark-brown wavy bob with a small clip on one side.
Large calm dark-brown eyes, soft eyebrows. Wears a soft mustard-yellow cardigan
over a cream tee, comfy sage-green trousers, simple slip-on shoes. Calm and
expressive but never exaggerated. Same hair, clothing, and proportions in
every image.
```

---

## 3. LOCKED STYLE BLOCK

> Identical for all 8 images. Paste it at the **top** of every prompt. Do not
> alter wording between scenes — style consistency is the whole point.

```
STYLE (locked):
Soft 2D anime illustration, slice-of-life, in the gentle register of
"A Silent Voice" (Kyoto Animation). Warm dark-brown line art — never pure black —
clean with a soft edge. Flat, simple cel shading, minimal gradients. Muted warm
pastel palette: cream and oatmeal walls, soft sage and dusty-blue accents, warm
honey-wood tones. Soft, even natural daylight with gentle shadows. Calm,
uncluttered, LOW-AROUSAL composition: a SINGLE clear focal subject (Mira) with
generous soft negative space. Wholesome, child-safe, ages 3-6. Absolutely NO
text, letters, numbers, logos, or signage anywhere in the image. Square 1:1,
1024x1024.
```

**Per-image prompt = LOCKED STYLE BLOCK + CHARACTER "Mira" + the Scene line below.**

---

## 4. Pages — script + image prompts

Each page lists the **on-screen narration** (goes in `pack.json`), the **image
filename** (matches `imageAsset`), and the **Scene** line to append to the
prompt.

### Page 1 — `mira_01_quiet_morning.png`
**Text:** "This is Mira. Mira likes things calm and quiet."
**Scene:** `Mira sitting peacefully on a soft rug at home in warm morning light, holding a small stuffed rabbit, gentle relaxed smile. Centered, lots of calm empty space around her. Mood: safe and calm.`

### Page 2 — `mira_02_go_to_store.png`
**Text:** "First, we go to the shop to buy some apples."
**Scene:** `Mira standing just inside a bright, tidy grocery shop entrance, holding a small empty basket, looking curious and okay. Soft pastel shelves blurred gently in the background. Single focal subject. Mood: ordinary, gentle.`

### Page 3 — `mira_03_too_loud.png`
**Text:** "Inside, it is very bright. The sounds get big."
**Scene:** `Mira pausing in the shop aisle, shoulders rising slightly, hands lifting gently toward her ears, a soft uncertain expression. NOT distressed or crying — gentle and child-safe. Faint soft motion lines suggest busy sound. Mood: a little overwhelmed but tender.`

### Page 4 — `mira_04_body_signal.png`
**Text:** "My tummy feels fluttery. That is okay."
**Scene:** `Mira looking down with one hand resting softly on her tummy, eyebrows gently raised, calm and noticing her feeling. Soft plain pastel background. Mood: quiet self-awareness.`

### Page 5 — `mira_05_calm_breath.png`  ← coping card page (`card_breathe`)
**Text:** "First, I take a slow, calm breath."
**Scene:** `Mira standing still with eyes softly closed, one hand on her chest, taking a slow calm breath, peaceful expression. A soft warm glow around her. Plenty of gentle negative space. Mood: calming, reassuring.`

### Page 6 — `mira_06_ear_muffs.png`
**Text:** "Then, I put on my quiet ear-muffs."
**Scene:** `Mira gently placing soft pastel ear-defender headphones over her ears, small relieved smile beginning. Calm and capable. Single focal subject. Mood: in control, soothed.`

### Page 7 — `mira_07_smaller_sounds.png`
**Text:** "The sounds feel smaller now. I feel calm."
**Scene:** `Mira standing relaxed wearing the ear-muffs, shoulders lowered, soft content smile, holding her basket again. Warm soft light. Mood: settled, comfortable.`

### Page 8 — `mira_08_i_did_it.png`
**Text:** "I did it. I helped my body feel calm."
**Scene:** `Mira walking out of the shop in warm afternoon light holding her basket with a couple of apples, a gentle proud smile, ear-muffs around her neck. Calm and happy. Mood: quiet pride and mastery.`

---

## 5. Coping card (in `pack.json`)

```
card_breathe — "Take a calm breath"
  1. Breathe in slowly while I count to four.
  2. Hold it for a moment.
  3. Breathe out slowly while I count to four.
  4. We can do this two more times.
```

---

## 6. Per-image REVIEW CHECKLIST (child-safety gate)

Run **every** image through this before approval. Any unchecked box = reject &
regenerate.

- [ ] Matches the locked style (warm brown outline — not black, muted pastels, flat shading)
- [ ] Mira is identical to the character sheet (hair, clip, cardigan, proportions)
- [ ] Single focal subject, low-arousal, calm — **no distress, fear, or scary content**
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate; no unsafe objects, no inappropriate content
- [ ] Anatomy clean — no extra limbs/fingers, no distorted hands or faces, no artifacts
- [ ] AI-disclosure watermark present (SynthID / C2PA) per store policy for kids' apps
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 7. Cast manifest entry (create / update `cast_manifest.json` at repo root)

```json
{
  "mira": {
    "approved": false,
    "reviewedBy": "",
    "reviewedDate": "",
    "notes": "Awaiting human review of all 8 scenes in /review_queue/"
  }
}
```

Flip `approved` to `true` (and fill reviewer + date) **only after all 8 images
pass the checklist**. `validateStoryCast()` throws `CastNotApprovedException` at
load time if `mira` is not approved — this is the in-code safety gate from
FV-001, so the story literally cannot open until you sign off.

---

## 8. Wiring it into the app (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. In `pubspec.yaml`, under `flutter: assets:`, add: `    - assets/packs/images/`
3. Move `pack.json` (this folder) to `assets/packs/loud.json`.
4. Add `mira: true` to the runtime approval map passed to `loadPack(...)`
   (currently hardcoded to `{'boy': true}` in `home.dart`). Source it from
   `cast_manifest.json` for production.
5. The "What your child practised" summary and the breathing coping card light
   up automatically from the `learningGoal` and `copingCards` fields.

> Note: the existing `sample_neuro.json` references bare filenames
> (`wash_hands.png`). The full-path convention above is the correct one; align
> the sample to it when those two review-queue images are approved.
