# Story Package — "The Foolish Lion and the Clever Rabbit"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_lionrabbit` · **SKU:** `sku_lionrabbit_001` · **Cast ids:** `bhasuraka`, `chatur`
**Source:** Adapted from the Panchatantra fable *"The Foolish Lion and the Clever Rabbit."*
A faithful, child-safe retelling — the lion is merely humbled and gets wet, never harmed or drowned.

---

## 1. Story intent & moral

A gentle fable about **quick thinking and staying calm**. The big bossy lion thinks he is the strongest, but the little rabbit uses his wits. By tricking the lion into splashing his own reflection, the rabbit saves the day without a single fight.
Moral: *Quick thinking beats brute strength.*

**learningGoal (parent summary, shown after the story):**
> "Quick thinking beats brute strength, and the importance of staying calm in tough situations."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "Bhasuraka" — the bossy lion:
A large, proud Asiatic lion. Soft golden-tawny fur, a big fluffy mane that looks warm and soft, slightly grumpy but never terrifying face. Big round paws. He is bossy and stompy, not fierce or violent. Child-safe and storybook style. Same size, colour, and mane in every image.
```

```
CHARACTER "Chatur" — the clever little rabbit:
A small, clever Indian hare. Soft dusty-brown fur with long ears, big expressive dark eyes, tiny white tail. Calm and polite. Expressive but not cartoonish. Tiny next to the lion. Same fur colour and proportions in every image.
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

### Page 1 — `lion_01_bossy.png` (Bhasuraka)
**Text:** "Once, a loud and bossy lion lived in a sunny forest."
**Scene:** `Bhasuraka the bossy lion sitting proudly on a large flat rock in a sunlit forest clearing, looking grumpy but fluffy and harmless. Warm light through the banyan leaves. Mood: proud, peaceful forest.`

### Page 2 — `lion_02_roaring.png` (Bhasuraka)
**Text:** "He roared at the animals every single day."
**Scene:** `Bhasuraka the lion standing with his mouth wide open in a big soft roar, looking more silly than scary, birds gently flying away in the warm sky. Mood: loud but safe.`

### Page 3 — `lion_03_rabbit_arrives.png` (Bhasuraka + Chatur)
**Text:** "One morning, a clever little rabbit came to see him."
**Scene:** `Tiny Chatur the little brown rabbit sitting calmly on the grass, looking up respectfully at the big Bhasuraka the lion who is looking down at him. Big-and-small contrast. Mood: brave and calm.`

### Page 4 — `lion_04_rabbit_speaks.png` (Bhasuraka + Chatur)
**Text:** "'There is another lion by the well!' the rabbit said bravely."
**Scene:** `Chatur the rabbit pointing gently with a tiny paw toward the distance, while Bhasuraka the lion looks surprised and a little cross. Dappled sunlight on mossy stones. Mood: storytelling, cleverness.`

### Page 5 — `lion_05_looks_down.png` (Bhasuraka)
**Text:** "The foolish lion stomped over to look down the deep well."
**Scene:** `Bhasuraka the lion leaning his big fluffy head over the edge of a beautiful old stone well, peering down into the water. Soft warm lighting. Mood: curiosity.`

### Page 6 — `lion_06_reflection.png` (Bhasuraka)
**Text:** "He saw his own face in the water, but thought it was a stranger."
**Scene:** `Looking down from over the lion's shoulder into the clear water of the well, showing the lion's reflection looking back up. It just looks like a confused lion in the water. Mood: discovery, harmless misunderstanding.`

### Page 7 — `lion_07_splash.png` (Bhasuraka)
**Text:** "He jumped in to splash the stranger, and got very wet and humbled!"
**Scene:** `Bhasuraka the lion sitting safely in shallow clear water at the bottom of the well, looking very wet, dripping, and silly. Completely unharmed, just humbled. Soft light coming from above. Mood: gentle comedy, safe.`

### Page 8 — `lion_08_safe_forest.png` (Chatur)
**Text:** "The quiet animals smiled, safe and peaceful at last."
**Scene:** `Chatur the clever rabbit sitting peacefully under a big beautiful banyan tree, chewing on some grass, the forest calm and golden around him. Mood: safe, peaceful, happy ending.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Bhasuraka and Chatur identical to their character sheets across every image
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] Lion is never scary, just silly; well scene shows no drowning or danger
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate; animals gentle and friendly
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "bhasuraka":  { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Lion — review all 8 scenes, ensure not scary" },
  "chatur": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Rabbit — review all 8 scenes" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/lionrabbit.json`.
3. Add `bhasuraka: true` and `chatur: true` to the runtime approval map.
