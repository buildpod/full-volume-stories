# Story Package — "The Three Fish"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_threefish` · **SKU:** `sku_threefish_001` · **Cast ids:** `orangefish`, `bluefish`, `yellowfish`
**Source:** Adapted from the Panchatantra fable *"The Three Fish."*
A faithful, child-safe retelling — no fish are caught or harmed. The lazy fish learns his lesson by having to swim extremely fast, but makes it to safety.

---

## 1. Story intent & moral

A gentle fable about **acting in time and foresight**. The fish who plans ahead is safe early; the quick-thinker reacts in time; the lazy one barely escapes.
Moral: *Don't put off what matters; act in time.*

**learningGoal (parent summary, shown after the story):**
> "Act in time and don't put off what matters."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "OrangeFish" — the planner:
A neat, energetic bright orange fish with smooth fins. Expressive, smart eyes. Child-safe and storybook style.
```

```
CHARACTER "BlueFish" — the quick-thinker:
A sleek, darting bright blue fish with slightly pointy fins. Looks clever and alert. Child-safe and storybook style.
```

```
CHARACTER "YellowFish" — the lazy one:
A round, chubby bright yellow fish with relaxed, droopy fins. Always looks a bit sleepy or relaxed. Child-safe and storybook style.
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

### Page 1 — `fish_01_pond.png` (OrangeFish + BlueFish + YellowFish)
**Text:** "Three little fish lived in a beautiful, sunny pond."
**Scene:** `Three colorful fish (one orange, one blue, one yellow) swimming happily together in clear, sparkling pond water with soft green lily pads and warm sunlight from above. Mood: peaceful, bright.`

### Page 2 — `fish_02_two_fish.png` (OrangeFish + BlueFish)
**Text:** "The orange fish always planned ahead. The blue fish was very quick."
**Scene:** `The orange fish and blue fish swimming alertly and playfully near some soft green reeds. They look energetic and smart. Warm underwater light. Mood: active.`

### Page 3 — `fish_03_lazy_fish.png` (YellowFish)
**Text:** "But the yellow fish was lazy and liked to wait."
**Scene:** `The chubby yellow fish resting comfortably on the soft sandy bottom of the pond, half-asleep, looking very relaxed and lazy. Warm golden light. Mood: sleepy, lazy.`

### Page 4 — `fish_04_net_splashes.png` (OrangeFish + BlueFish + YellowFish)
**Text:** "One day, a big fishing net splashed into the water!"
**Scene:** `A soft, harmless-looking woven rope net splashing gently into the water, sending up bright bubbles. The three fish look surprised but not terrified. Soft lighting, no people shown. Mood: sudden action.`

### Page 5 — `fish_05_orange_safe.png` (OrangeFish)
**Text:** "The orange fish had already swam safely to the deep reeds."
**Scene:** `The orange fish waiting safely and calmly deep inside thick, soft green reeds, far away from any net. Warm light filtering down. Mood: safe, prepared.`

### Page 6 — `fish_06_blue_hides.png` (BlueFish)
**Text:** "The blue fish thought quickly and hid under a large lily pad."
**Scene:** `The blue fish tucked cleverly under a massive, beautiful green lily pad, looking out safely while the net sinks harmlessly nearby. Mood: clever, hiding.`

### Page 7 — `fish_07_yellow_swims.png` (YellowFish)
**Text:** "The yellow fish woke up and had to swim faster than ever before!"
**Scene:** `The chubby yellow fish swimming frantically and comically fast away from the falling net, looking wide awake and silly. Lots of soft bubbles. Mood: funny scramble, safe.`

### Page 8 — `fish_08_safe_together.png` (OrangeFish + BlueFish + YellowFish)
**Text:** "All three fish made it to the deep water, safe and sound."
**Scene:** `The orange, blue, and yellow fish happily reunited in the deep, safe, beautiful part of the pond. The yellow fish looks out of breath but happy. Mood: safe, relieved, friends.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Orange, Blue, and Yellow fish identical to their descriptions across all images
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] The net is soft and not frightening; no fish is ever caught or hurt
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "orangefish": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Orange fish — review all scenes" },
  "bluefish": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Blue fish — review all scenes" },
  "yellowfish": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Yellow fish — review all scenes" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/threefish.json`.
3. Add `orangefish: true`, `bluefish: true`, and `yellowfish: true` to the runtime approval map.
