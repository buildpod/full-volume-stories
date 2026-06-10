# Story Package — "The Blue Jackal"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_bluejackal` · **SKU:** `sku_bluejackal_001` · **Cast ids:** `chanda`
**Source:** Adapted from the Panchatantra fable *"The Blue Jackal."*
A faithful, child-safe retelling — the jackal's disguise is ruined by a funny mistake, the animals just laugh, and he safely washes it off.

---

## 1. Story intent & moral

A funny fable about **being yourself and honesty**. A jackal accidentally dyes himself blue and pretends to be a king to get free food. But when he hears other jackals howl, he can't help but join in, giving away his secret.
Moral: *Be yourself; honesty is better than pretending.*

**learningGoal (parent summary, shown after the story):**
> "Be yourself, because honesty is better than pretending."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "Chanda" — the silly jackal:
A small, skinny, expressive Indian jackal. Initially has soft tan and sandy-brown fur with a bushy tail. In most images, his fur is dyed a bright, vibrant, solid indigo blue (except his eyes and nose). Big pointy ears, a slightly goofy expression. Child-safe and storybook style, never scary. Same proportions in every image.
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

### Page 1 — `jackal_01_hungry.png` (Chanda)
**Text:** "Chanda the jackal was always looking for an easy dinner."
**Scene:** `Chanda the tan-coloured jackal looking hopeful and a bit silly near the edge of an old village at sunset, sniffing the air. Soft warm evening light. Mood: curious, a bit hungry.`

### Page 2 — `jackal_02_fall.png` (Chanda)
**Text:** "One night, he tripped and fell into a big pot of blue dye!"
**Scene:** `Chanda the jackal tumbling paws-over-tail backwards into a very large clay pot. The scene is comedic and completely safe. Warm twilight lighting, old village street. Mood: clumsy surprise.`

### Page 3 — `jackal_03_blue.png` (Chanda)
**Text:** "He climbed out, looking very bright and very blue."
**Scene:** `Chanda the jackal sitting outside the pot, looking down at himself in shock. His fur is completely bright indigo blue now. He looks silly and surprised. Mood: gentle comedy, magical surprise.`

### Page 4 — `jackal_04_king.png` (Chanda)
**Text:** "The forest animals thought he was a magical new king."
**Scene:** `Chanda the bright blue jackal standing proudly, while a deer and a rabbit look at him with wide, amazed eyes. Soft forest clearing. Mood: awe, silliness.`

### Page 5 — `jackal_05_treats.png` (Chanda)
**Text:** "He sat on a tall rock and let everyone bring him treats."
**Scene:** `Chanda the blue jackal sitting comfortably on a mossy rock like a throne, looking very pleased, while a monkey gently places a pile of sweet mangoes near him. Mood: comfortable, a bit lazy.`

### Page 6 — `jackal_06_howl_heard.png` (Chanda)
**Text:** "But soon, a real jackal howled happily in the distance."
**Scene:** `Chanda the blue jackal sitting on his rock with his ears suddenly perked up straight, eyes wide, listening. The forest is quiet. Mood: sudden realization, distraction.`

### Page 7 — `jackal_07_howling.png` (Chanda)
**Text:** "Chanda forgot he was the king and howled right back!"
**Scene:** `Chanda the blue jackal sitting with his head thrown back, happily howling with his eyes closed, forgetting to be a king. The deer and monkey watch in funny surprise. Mood: comedic mistake.`

### Page 8 — `jackal_08_washing.png` (Chanda)
**Text:** "The animals laughed, and the silly blue jackal ran away to wash."
**Scene:** `Chanda the blue jackal happily splashing in the shallow part of the beautiful lotus lake to wash the dye off, as the tan fur starts to show again. The animals watch with gentle smiles. Mood: happy ending, gentle comedy.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Chanda identical to character sheet (tan in image 1 and part of 8, bright blue in 2-7)
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] Fall into the pot is funny and safe, not dangerous
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate; animals gentle and friendly
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "chanda": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Jackal — review all 8 scenes" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/bluejackal.json`.
3. Add `chanda: true` to the runtime approval map.
