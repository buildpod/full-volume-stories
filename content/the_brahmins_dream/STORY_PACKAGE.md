# Story Package — "The Boy's Dream"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_brahminsdream` · **SKU:** `sku_brahmin_001` · **Cast ids:** `dev`
**Source:** Adapted from the Panchatantra fable *"The Brahmin's Dream (Castles in the Air)."*
A faithful, child-safe retelling — the character is adapted to a young boy ("Dev") to be more relatable, and the consequence is just some spilled pots and a gentle lesson learned.

---

## 1. Story intent & moral

A light, funny fable about **focusing on what's real and present**. Dev daydreams so vividly about what he will do when he is rich that he accidentally breaks the very pots that were going to make him his first coin.
Moral: *Don't count on what you don't yet have.*

**learningGoal (parent summary, shown after the story):**
> "Don't count on what you don't yet have; focus on the present."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "Dev" — the daydreaming boy:
A young Indian boy, about 6 years old, with warm brown skin, short messy dark hair, wearing a simple soft-green tunic and loose trousers. Barefoot. He has an expressive, dreamy face and a gentle smile. Child-safe and storybook style. Same clothes and proportions in every image.
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

### Page 1 — `dream_01_boy.png` (Dev)
**Text:** "Dev was a young boy who helped make beautiful clay pots."
**Scene:** `Dev the 6-year-old boy in a green tunic, gently smoothing the edge of a wet clay pot in a sunlit village courtyard. Warm sunlight and soft shadows. Mood: peaceful, creative.`

### Page 2 — `dream_02_pots.png` (Dev)
**Text:** "One warm afternoon, he sat next to a big pile of finished pots."
**Scene:** `Dev the boy sitting comfortably on a woven mat, leaning his back against a stone wall, right next to a neat pile of beautifully baked brown clay pots. Warm afternoon light. Mood: resting, comfortable.`

### Page 3 — `dream_03_sleep.png` (Dev)
**Text:** "He closed his eyes and began to daydream about the future."
**Scene:** `Dev the boy with his eyes gently closed, a soft smile on his face, holding a small wooden stick loosely in his hand. The scene is slightly softer and dreamier. Mood: sleepy, dreaming.`

### Page 4 — `dream_04_cow.png` (Dev)
**Text:** "He dreamed he sold all the pots and bought a soft, white cow."
**Scene:** `Inside Dev's dream (soft, cloudy edges): Dev the boy standing proudly next to a beautiful, gentle white cow with a little bell around its neck. Warm glowing light. Mood: proud, happy dream.`

### Page 5 — `dream_05_rich.png` (Dev)
**Text:** "Then he dreamed he became the richest boy in the whole village!"
**Scene:** `Inside Dev's dream: Dev the boy sitting on a very fancy, soft cushion, wearing a slightly fancier green tunic, looking very important and pleased with himself. Mood: silly, proud dream.`

### Page 6 — `dream_06_waving.png` (Dev)
**Text:** "In his dream, he waved his stick proudly in the air."
**Scene:** `Inside Dev's dream: Dev the boy standing up confidently and swinging his small wooden stick through the air with a big proud smile, as if giving an order. Mood: energetic, overconfident.`

### Page 7 — `dream_07_smash.png` (Dev)
**Text:** "Smash! He woke up and saw he had broken his own pots by mistake."
**Scene:** `Back in reality: Dev the boy sitting wide awake with a shocked expression, holding his wooden stick. Next to him, one of the clay pots is broken into a few large pieces. Warm afternoon light. Mood: sudden surprise, a comedic mistake.`

### Page 8 — `dream_08_smile.png` (Dev)
**Text:** "Dev sighed and smiled, deciding to focus on the work right in front of him."
**Scene:** `Dev the boy gently gathering the broken clay pieces with a soft, slightly embarrassed smile, ready to start working again. The village is peaceful around him. Mood: lesson learned, calm acceptance.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Dev identical to character sheet across every image
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] Breaking the pot is a gentle comedic mistake, not scary or violent
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "dev": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Boy — review all 8 scenes" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/brahminsdream.json`.
3. Add `dev: true` to the runtime approval map.
