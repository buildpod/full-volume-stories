# Story Package — "The Mice that Ate Iron"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_miceateiron` · **SKU:** `sku_miceiron_001` · **Cast ids:** `naduka`, `lakshman`
**Source:** Adapted from the Panchatantra fable *"The Mice that Ate Iron."*
A faithful, child-safe retelling — instead of kidnapping a child, the merchant simply hides his friend's walking stick. It's a completely harmless prank that teaches the same lesson.

---

## 1. Story intent & moral

A gentle fable about **honesty and fairness**. When a friend lies about mice eating iron, the other friend uses a silly lie (a bird carrying a walking stick) to show him how ridiculous it sounds.
Moral: *Honesty is the best policy, and true friends tell the truth.*

**learningGoal (parent summary, shown after the story):**
> "Honesty is the best policy, and true friends tell the truth."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "Naduka" — the clever merchant:
A friendly Indian village man with warm brown skin, wearing a simple blue tunic and a soft yellow turban. He has a kind face and a clever sparkle in his eyes. Child-safe and storybook style. Same clothes in every image.
```

```
CHARACTER "Lakshman" — the silly friend:
A slightly plump Indian village man with warm brown skin, wearing a simple white tunic and a red turban. He has a funny, expressive face. Child-safe and storybook style. Same clothes in every image.
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

### Page 1 — `iron_01_leaving.png` (Naduka + Lakshman)
**Text:** "Naduka left his heavy iron weighing scales with his friend Lakshman."
**Scene:** `Naduka in his blue tunic handing a set of old-fashioned, heavy black iron weighing scales to his friend Lakshman in a white tunic. A sunny village street. Mood: friendly.`

### Page 2 — `iron_02_lie_one.png` (Naduka + Lakshman)
**Text:** "When he came back, Lakshman said, 'Oh, the mice ate your iron scales!'"
**Scene:** `Lakshman shrugging his shoulders with a very silly, fake innocent expression. Naduka is standing opposite him, looking surprised and skeptical. Mood: a silly lie.`

### Page 3 — `iron_03_thinks.png` (Naduka)
**Text:** "Naduka knew mice could not eat iron, but he did not shout."
**Scene:** `Naduka the merchant walking away down the village path, tapping his chin thoughtfully with one finger, clearly hatching a clever, gentle plan. Warm afternoon light. Mood: clever thinking.`

### Page 4 — `iron_04_hiding.png` (Naduka)
**Text:** "The next day, Naduka hid Lakshman's favorite walking stick."
**Scene:** `Naduka gently tucking a beautiful, carved wooden walking stick behind a large, soft leafy bush near a stone wall. He looks playfully secretive. Mood: a harmless prank.`

### Page 5 — `iron_05_lie_two.png` (Naduka + Lakshman)
**Text:** "'Oh no,' said Naduka. 'A small bird flew away with your stick!'"
**Scene:** `Naduka holding his hands up in mock surprise, telling his story to Lakshman, who is looking very confused and holding his hands out in disbelief. A tiny bird flies past in the background. Mood: another silly lie.`

### Page 6 — `iron_06_realizes.png` (Lakshman)
**Text:** "Lakshman realized his friend was tricking him back."
**Scene:** `Close-up on Lakshman looking suddenly realizing, one hand on his forehead, looking a bit embarrassed as he figures out the joke. Soft warm lighting. Mood: realization.`

### Page 7 — `iron_07_confess.png` (Naduka + Lakshman)
**Text:** "Both friends laughed and confessed their silly lies."
**Scene:** `Naduka and Lakshman sitting together on a low stone wall, both laughing heartily and warmly, pointing at each other in good fun. Mood: friendship, forgiveness.`

### Page 8 — `iron_08_friends_again.png` (Naduka + Lakshman)
**Text:** "Lakshman returned the iron scales, and Naduka returned the stick."
**Scene:** `Naduka holding the carved wooden stick, and Lakshman holding the heavy iron scales, exchanging them with warm, happy smiles in the golden village sunset. Mood: happy ending, honesty.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Naduka and Lakshman identical to character sheets across every image
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] The prank is gentle and funny; everyone is happy at the end
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "naduka": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Merchant Naduka — review all scenes" },
  "lakshman": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Friend Lakshman — review all scenes" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/miceateiron.json`.
3. Add `naduka: true` and `lakshman: true` to the runtime approval map.
