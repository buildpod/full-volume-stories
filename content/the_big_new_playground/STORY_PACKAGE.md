# Story Package — "The Big New Playground"

**Mode:** A (neurodivergent / social story) · **Template:** firstThen · **Pages:** 8
**Pack id:** `pack_playground` · **SKU:** `sku_playground_001` · **Cast id:** `sam`
**Intended use:** Premium library story.

This is a complete, ready-to-produce package: story script, character sheet,
locked style block, eight paste-ready image prompts, the matching pack JSON
(`pack.json` in this folder), and the human-review + wiring steps required by the
child-safety gate.

> **How this flows through Antigravity:** paste each prompt below into your
> Antigravity image-generation step (Gemini 3 Pro Image / "Nano Banana Pro"),
> generate **build-time only**, and write every output into `/review_queue/`.
> Nothing reaches a child until it passes the checklist and `cast_manifest.json`
> marks `sam` as `approved: true`.

---

## 1. Story intent (why this story exists)

A social story that teaches a child to **prepare for a new place and ask for a break**.
Going to a new environment is often overwhelming.
Arc: preparing to go → arriving and feeling unsure → recognizing the big feeling →
finding one safe/familiar thing → taking a coping break → feeling ready.
First/then structure throughout, low-arousal art, one coping card.

**learningGoal (parent summary, shown after the story):**
> "Preparing to visit a new place, noticing safe things, and asking for a break if it feels too big."

---

## 2. Character sheet — "Sam" (one-off, this pack only)

> Paste this block into **every** scene prompt unchanged. One-off character:
> they only need to be consistent **within** this pack, not across other stories.

```
CHARACTER "Sam" (keep identical in every image):
A gentle 5-year-old child. Soft round face, warm medium-brown skin. Short curly dark hair.
Large calm dark eyes. Wears a comfy soft-green zip-up hoodie over a white t-shirt,
comfy dark-grey sweatpants, and simple trainers. Expressive but never exaggerated.
Same hair, clothing, and proportions in every image.
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
uncluttered, LOW-AROUSAL composition: a SINGLE clear focal subject (Sam) with
generous soft negative space. Wholesome, child-safe, ages 3-6. Absolutely NO
text, letters, numbers, logos, or signage anywhere in the image. Square 1:1,
1024x1024.
```

**Per-image prompt = LOCKED STYLE BLOCK + CHARACTER sheet + the Scene line below.**

---

## 4. Pages — script + image prompts

Each page lists the **on-screen narration** (goes in `pack.json`), the **image
filename** (matches `imageAsset`), and the **Scene** line to append to the
prompt.

### Page 1 — `sam_01_getting_ready.png`
**Text:** "This is Sam. Sam is going to a brand new playground."
**Scene:** `Sam standing calmly near a front door at home, putting on small trainers. Soft natural light from a window. Centered, lots of calm empty space around them. Mood: safe and ordinary.`

### Page 2 — `sam_02_arrive.png`
**Text:** "First, they arrive at the playground. It is very big."
**Scene:** `Sam standing at the gentle entrance of a very quiet, softly drawn playground. The playground equipment is muted and slightly blurred in the background. Single focal subject. Mood: vast, new, but gentle.`

### Page 3 — `sam_03_feeling_unsure.png`
**Text:** "Sam feels butterflies in their tummy. Everything is new."
**Scene:** `Sam standing still, hands softly tucked into the front pocket of their green hoodie, shoulders slightly raised, a soft uncertain expression. NOT distressed or crying — gentle and child-safe. Mood: a little overwhelmed but tender.`

### Page 4 — `sam_04_okay_to_feel.png`
**Text:** "It is okay to feel unsure in a new place."
**Scene:** `Sam looking down softly, calm and noticing their feeling. Soft plain pastel background of gentle trees. Mood: quiet self-awareness.`

### Page 5 — `sam_05_finding_swing.png`
**Text:** "First, Sam finds one thing that looks safe and familiar."
**Scene:** `Sam looking gently toward the right side of the frame with a soft, slightly relieved expression, pointing a finger gently. Plenty of gentle negative space. Mood: calming, observant.`

### Page 6 — `sam_06_blue_swing.png`
**Text:** "It is a quiet blue swing at the edge of the park."
**Scene:** `Sam walking gently toward a simple, soft-blue child's swing hanging quietly by itself near some soft green trees. Warm soft light. Mood: comforting, familiar.`

### Page 7 — `sam_07_taking_break.png`  ← coping card page (`card_ask_break`)
**Text:** "Then, Sam asks for a short break to sit on the swing."
**Scene:** `Sam sitting gently on the blue swing, feet not touching the ground, looking peaceful and relaxed. A soft warm glow around them. Mood: calming, resting, self-regulating.`

### Page 8 — `sam_08_ready_to_play.png`
**Text:** "The break helps. Now Sam feels ready to play."
**Scene:** `Sam standing near the swing, looking gently toward the playground with a soft, confident smile. Calm and ready. Mood: quiet pride and mastery.`

---

## 5. Coping card (in `pack.json`)

```
card_ask_break — "Ask for a break"
  1. Notice if my body feels too fast or too big.
  2. Find my grown-up.
  3. Say 'I need a break please.'
  4. Go to a quiet spot together until I feel calm.
```

---

## 6. Per-image REVIEW CHECKLIST (child-safety gate)

Run **every** image through this before approval. Any unchecked box = reject &
regenerate.

- [ ] Matches the locked style (warm brown outline — not black, muted pastels, flat shading)
- [ ] Character is identical to the character sheet (hair, clothing, proportions)
- [ ] Single focal subject, low-arousal, calm — **no distress, fear, or scary content**
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate; no unsafe objects
- [ ] Anatomy clean — no extra limbs/fingers, no distorted hands or faces, no artifacts
- [ ] AI-disclosure watermark present (SynthID / C2PA) per store policy for kids' apps
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 7. Cast manifest entry (create / update `cast_manifest.json` at repo root)

```json
{
  "sam": {
    "approved": false,
    "reviewedBy": "",
    "reviewedDate": "",
    "notes": "Awaiting human review of all 8 scenes in /review_queue/"
  }
}
```

---

## 8. Wiring it into the app (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` (this folder) to `assets/packs/playground.json`.
3. Add `sam: true` to the runtime approval map.
