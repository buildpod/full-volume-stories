# Story Package — "The Talkative Tortoise"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_talkativetortoise` · **SKU:** `sku_tortoise_001` · **Cast ids:** `kambu`, `goose`
**Source:** Adapted from the Panchatantra fable *"The Talkative Tortoise."*
A faithful, child-safe retelling — the tortoise does not die, but falls safely into a pond and learns his lesson.

---

## 1. Story intent & moral

A gentle fable about **listening to good advice and thinking before you speak**. The tortoise wants to help his friends save him, but he can't resist talking. When he speaks, he falls, but lands softly in the water.
Moral: *Think before you speak, and listen to good advice.*

**learningGoal (parent summary, shown after the story):**
> "Think before you speak, and listen to good advice."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "Kambu" — the talkative tortoise:
A small, friendly pond tortoise with a smooth olive-green shell, gentle rounded features, and big expressive eyes. Warm and silly, never scary. Child-safe and storybook style. Same size, colour, and shell pattern in every image.
```

```
CHARACTER "Goose" — the two friendly geese:
Elegant, soft white geese with warm orange beaks and feet. Friendly and helpful. Always drawn in pairs when together, but identical. Soft feathers, gentle eyes. Expressive but not cartoonish. Same feathers and proportions in every image.
```

---

## 3. LOCKED STYLE BLOCK

```
STYLE (locked):
Soft 2D anime illustration, slice-of-life storybook, in the gentle warm register
of Studio Ghibli / "A Silent Voice". Warm dark-brown line art — never pure black.
Flat, simple cel shading with soft gradients. Warm, inviting but still muted
palette: honey sunlight, sage and moss greens, warm stone, dusty rose, soft sky
blue. An old Indian forest setting: banyan and peepal trees, a weathered stone
temple ruin, a lotus lake. Soft natural light, gentle depth. Wholesome,
child-safe, ages 3-6. Warm and engaging composition (Mode B) but calm and never
frightening. Absolutely NO text, letters, numbers, logos, or signage in the
image. Square 1:1, 1024x1024.
```

---

## 4. Pages — script + image prompts

### Page 1 — `tortoise_01_lake.png` (Kambu)
**Text:** "Once, a friendly but very talkative tortoise lived in a big lake."
**Scene:** `Kambu the friendly olive-green tortoise sitting comfortably on a lily pad in a beautiful blue lake, looking happy and talkative. Warm sunlight. Mood: peaceful, chatty.`

### Page 2 — `tortoise_02_friends.png` (Kambu + Goose)
**Text:** "His best friends were two lovely white geese who flew in the sky."
**Scene:** `Two lovely white geese swimming gently near Kambu the tortoise, all of them looking like good friends. Soft ripples in the water, mossy stones nearby. Mood: friendship.`

### Page 3 — `tortoise_03_dry_lake.png` (Kambu)
**Text:** "One day, the lake began to dry up in the hot sun."
**Scene:** `Kambu the tortoise looking a little worried near the edge of a drying lake, exposing warm mud and stones. The sun is warm and bright, but the scene is still soft and safe. Mood: mild worry.`

### Page 4 — `tortoise_04_idea.png` (Kambu + Goose)
**Text:** "The geese said, 'We will carry you to a new lake on a strong stick!'"
**Scene:** `The two white geese showing a strong wooden stick to Kambu the tortoise. They look helpful and encouraging. Warm golden hour light. Mood: a clever plan.`

### Page 5 — `tortoise_05_warning.png` (Kambu + Goose)
**Text:** "'Hold on tight with your mouth, and do not speak!' they warned."
**Scene:** `Kambu the tortoise biting firmly onto the middle of the stick, while the two geese hold the ends in their beaks, looking at him seriously to make sure he understands. Mood: preparation.`

### Page 6 — `tortoise_06_flying.png` (Kambu + Goose)
**Text:** "Up they flew, but soon the tortoise wanted to say hello to a bird."
**Scene:** `The two geese flying gently in the soft blue sky, carrying the stick with Kambu the tortoise biting onto it. Another small bird flies nearby, and Kambu looks eager to talk. Mood: soaring, a funny mistake about to happen.`

### Page 7 — `tortoise_07_falling.png` (Kambu)
**Text:** "He opened his mouth, let go of the stick, and down he fell!"
**Scene:** `Kambu the tortoise tumbling gently through the air, looking surprised but not scared, with the stick and geese far above him. Soft fluffy clouds and tree tops below. Mood: mild surprise, safe.`

### Page 8 — `tortoise_08_safe_splash.png` (Kambu)
**Text:** "Splash! He landed safely in a soft pond, feeling very silly."
**Scene:** `Kambu the tortoise sitting safely in a shallow, beautiful lotus pond, splashing gently, looking very silly and a bit embarrassed but completely unharmed. A frog watches nearby. Mood: gentle comedy, safe landing.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Kambu and Goose identical to their character sheets across every image
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] Falling scene is gentle, landing is safe and completely harmless
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate; animals gentle and friendly
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "kambu":  { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Tortoise — review all 8 scenes" },
  "goose": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Geese — review all scenes with geese" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/talkativetortoise.json`.
3. Add `kambu: true` and `goose: true` to the runtime approval map.
