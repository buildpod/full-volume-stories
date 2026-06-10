# Story Package — "The Musical Donkey"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_musicaldonkey` · **SKU:** `sku_musicaldonkey_001` · **Cast ids:** `dron_donkey`, `jackal_friend`
**Source:** Adapted from the Panchatantra fable *"The Musical Donkey."*
A faithful, child-safe retelling — the donkey is simply shooed away by the farmer, never beaten or harmed.

---

## 1. Story intent & moral

A lighthearted fable about **situational awareness and listening to advice**. The donkey is so happy he ignores his friend's warning not to sing loudly at night, which gets them safely but firmly shooed away from their tasty snack.
Moral: *There is a right time and place for everything.*

**learningGoal (parent summary, shown after the story):**
> "There is a right time and place for everything, and listening to friends is smart."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "Dron" — the musical donkey:
A friendly grey donkey with big soft ears, a messy black mane, and a sweet, slightly goofy face. Warm and harmless. Child-safe and storybook style. Same colour and proportions in every image.
```

```
CHARACTER "Jackal Friend" — the careful companion:
A small, clever-looking Indian jackal with soft tan and sandy-brown fur, a bushy tail, and large pointy ears. Expressive and careful. Child-safe and storybook style. Same size and fur colour in every image.
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

### Page 1 — `donkey_01_singing.png` (Dron)
**Text:** "Dron the donkey loved to sing, but his voice was very loud."
**Scene:** `Dron the grey donkey standing in a sunlit green meadow with his head raised, happily singing with his mouth wide open. A few birds gently fly away from the noise. Mood: happy, loud.`

### Page 2 — `donkey_02_field.png` (Dron + Jackal Friend)
**Text:** "One night, he and his jackal friend went to a cucumber field."
**Scene:** `Dron the donkey and the tan jackal friend walking gently into a field full of large, green, leafy cucumber vines. Soft, beautiful moonlight. Mood: quiet, exciting.`

### Page 3 — `donkey_03_eating.png` (Dron + Jackal Friend)
**Text:** "The cucumbers were so crunchy and sweet!"
**Scene:** `Dron the donkey and the jackal happily munching on fresh green cucumbers in the moonlight. Dron looks very, very happy. Mood: peaceful, satisfied.`

### Page 4 — `donkey_04_happy.png` (Dron)
**Text:** "Dron was so happy he wanted to sing a very loud song."
**Scene:** `Dron the donkey taking a deep breath, puffing out his chest, getting ready to sing loudly. His eyes are closed happily. Moonlight shining on him. Mood: anticipation, silly.`

### Page 5 — `donkey_05_warning.png` (Dron + Jackal Friend)
**Text:** "'Wait!' said the jackal. 'The farmer is sleeping nearby!'"
**Scene:** `The jackal holding up one paw, looking worried and trying to quietly warn Dron the donkey, pointing toward a small farmhouse in the distance. Dron isn't listening. Mood: warning.`

### Page 6 — `donkey_06_loud_song.png` (Dron + Jackal Friend)
**Text:** "But Dron did not listen, and began to sing a loud 'Hee-haw!'"
**Scene:** `Dron the donkey singing as loudly as he can, with a big goofy smile. The jackal is covering his pointy ears with his paws, wincing gently. Mood: very loud, comedic.`

### Page 7 — `donkey_07_shooed.png` (Dron + Jackal Friend)
**Text:** "The farmer woke up and shooed them right out of the field."
**Scene:** `A farmer holding a wooden stick, gently but firmly shooing Dron and the jackal out of the cucumber field. No one is hurt, everyone is just running away safely in the moonlight. The farmer is annoyed, not violent. Mood: rushing, safe escape.`

### Page 8 — `donkey_08_lesson.png` (Dron + Jackal Friend)
**Text:** "Dron realized that there is a right time and a right place for everything."
**Scene:** `Dron the donkey looking a bit sheepish and apologetic to his jackal friend, safely back in the meadow under the moon. The jackal smiles forgivingly. Mood: lesson learned, safe friendship.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Dron and Jackal identical to character sheets across every image
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] The farmer is annoyed but absolutely not violent; no hitting or beating
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "dron_donkey": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Donkey — review all scenes" },
  "jackal_friend": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Jackal — review all scenes" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/musicaldonkey.json`.
3. Add `dron_donkey: true` and `jackal_friend: true` to the runtime approval map.
