# Story Package — "The Wise Quail"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_wisequail` · **SKU:** `sku_wisequail_001` · **Cast ids:** `leader_quail`, `flock_quail`
**Source:** Adapted from the Jataka/Panchatantra fable *"The Wise Quail" (Sammodamana Jataka).*
A faithful, child-safe retelling — the hunter is never shown on screen, the net is just a soft trap, and the birds escape safely without any harm or violence.

---

## 1. Story intent & moral

A beautiful fable about **teamwork and unity**. When trapped individually, the birds panic. When they listen to their leader and fly together as one, they are strong enough to lift the heavy net and escape.
Moral: *Working together makes us strong enough to solve big problems.*

**learningGoal (parent summary, shown after the story):**
> "Working together makes us strong enough to solve big problems."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "Leader Quail" — the wise leader:
A small, plump Indian quail with warm earthy brown and speckled feathers, slightly larger than the rest. He has a small, gentle crest of feathers on his head. Very expressive, calm, and smart. Child-safe and storybook style. Same feathers in every image.
```

```
CHARACTER "Flock Quail" — the other little birds:
Small, plump Indian quails, similar to the leader but slightly smaller and without the crest. They look soft, round, and friendly. Child-safe and storybook style. Always drawn together.
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

### Page 1 — `quail_01_flock.png` (Flock Quail)
**Text:** "A flock of little quails lived in the tall, soft grass."
**Scene:** `A large, happy group of small, round, speckled brown quails walking together through tall, soft, golden-green grass. Warm sunlight. Mood: peaceful, happy.`

### Page 2 — `quail_02_seeds.png` (Leader Quail + Flock Quail)
**Text:** "They loved to search for tasty seeds all day long."
**Scene:** `The leader quail with a small feather crest, standing gently with the flock, all of them pecking happily at tiny seeds on the ground near an old mossy stone. Mood: busy, calm.`

### Page 3 — `quail_03_net.png` (Flock Quail)
**Text:** "One day, a big soft net fell right over the flock!"
**Scene:** `A soft, harmless-looking woven rope net draped gently over the tall grass, covering the flock of quails. The quails look surprised but not terrified. No people are visible. Mood: sudden surprise.`

### Page 4 — `quail_04_scared.png` (Flock Quail)
**Text:** "The quails fluttered and bumped into each other, feeling scared."
**Scene:** `The quails under the net bumping into each other gently, looking confused and a bit worried, wings fluttering softly. Mood: mild worry, confusion.`

### Page 5 — `quail_05_leader.png` (Leader Quail + Flock Quail)
**Text:** "'Stop flapping!' called the wise leader quail. 'We must work together!'"
**Scene:** `The leader quail standing tall and calm in the middle of the fluttering flock under the net, raising one wing gently to quiet them down. Mood: leadership, calm.`

### Page 6 — `quail_06_plan.png` (Leader Quail + Flock Quail)
**Text:** "'On the count of three, everyone fly straight up!'"
**Scene:** `All the little quails looking attentively at the leader quail, their wings tucked in, ready to jump. Everyone is focused. Mood: preparation, teamwork.`

### Page 7 — `quail_07_lifting.png` (Leader Quail + Flock Quail)
**Text:** "One, two, three! They all flapped hard and lifted the net into the sky."
**Scene:** `The whole flock of quails flying straight up together, beautifully lifting the large rope net high into the air. Golden afternoon light. Mood: teamwork, success, soaring.`

### Page 8 — `quail_08_safe.png` (Leader Quail + Flock Quail)
**Text:** "They flew to a thorny bush, dropped the net, and were safe and free."
**Scene:** `The quails flying safely away into the bright blue sky, leaving the net caught safely and harmlessly on a thorny bush below. Everyone is free and happy. Mood: safe, triumphant.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Leader and Flock identical to character sheets across every image
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] The net is soft and not frightening; no bird is ever hurt
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "leader_quail": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Leader Quail — review all scenes" },
  "flock_quail": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Flock Quail — review all scenes" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/wisequail.json`.
3. Add `leader_quail: true` and `flock_quail: true` to the runtime approval map.
