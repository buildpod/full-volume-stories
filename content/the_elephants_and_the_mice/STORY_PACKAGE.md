# Story Package — "The Elephants and the Mice"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_eltmice` · **SKU:** `sku_eltmice_001` · **Cast ids:** `bula`, `chiku`
**Source:** Adapted from the Panchatantra fable *"The Elephants and the Mice."*
A faithful, child-safe retelling — no harm comes to any character.

> **How this flows through Antigravity:** paste each prompt into your Gemini 3
> Pro Image step (Nano Banana Pro), generate **build-time only**, write outputs
> to `/review_queue/`, then review → `cast_manifest.json` (`bula` + `chiku`
> approved) → bundle. Nothing reaches a child until both cast members pass.

---

## 1. Story intent & moral

A warm fable about **kindness, respect, and reciprocity**: a brave little mouse
politely asks a mighty elephant herd to spare the mice's tiny homes; later, when
hunters' nets trap the elephants, the whole mouse colony gnaws them free.
Two morals land naturally: *even the smallest friend can help the greatest*, and
*kindness always finds its way back*.

**learningGoal (parent summary, shown after the story):**
> "Kindness and respect for others — even the smallest friend — and how helping
> each other makes everyone stronger."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on.
No coping cards (those belong to Mode A).

---

## 2. Character sheets (one-off, this pack only — keep identical across all 8 images)

```
CHARACTER "Bula" — the gentle elephant leader:
A large, kind Asian elephant. Soft warm-grey skin with a faint dusty-rose
undertone, gentle wrinkles, rounded friendly form. Big calm dark eyes with soft
lashes, small relaxed smile, ears softly fanned. Moves slowly and kindly. Never
fierce or scary. Same size, colour, and gentle face in every image.
```

```
CHARACTER "Chiku" — the brave little mouse:
A small field mouse, warm chestnut-brown fur, a paler cream tummy, big bright
hopeful black eyes, round soft ears, tiny pink paws and nose, a small whiskery
face. Brave and friendly, expressive but never cartoonish. Tiny next to Bula.
Same fur colour and proportions in every image.
```

---

## 3. LOCKED STYLE BLOCK (paste at the top of every prompt — unchanged)

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

**Per-image prompt = LOCKED STYLE BLOCK + relevant CHARACTER sheet(s) + the Scene line.**

---

## 4. Pages — script + image prompts

### Page 1 — `ele_01_mouse_home.png`  (Chiku)
**Text:** "By an old stone temple lived a colony of happy little mice."
**Scene:** `Chiku the little mouse peeking cheerfully from a cosy burrow among the warm stones of a sunlit old temple ruin, soft green plants around, golden morning light. Chiku is the clear focal subject. Mood: cosy, happy, safe.`

### Page 2 — `ele_02_herd_passes.png`  (Bula)
**Text:** "One day, a great herd of elephants came walking to the lake."
**Scene:** `Bula the gentle elephant leading a soft herd of elephants along a forest path toward a lotus lake, big slow friendly steps, warm dappled sunlight through tall trees. Calm and majestic, not scary. Mood: gentle wonder.`

### Page 3 — `ele_03_chiku_asks.png`  (Bula + Chiku)
**Text:** "Brave little Chiku squeaked, 'Please, kind friends, mind our tiny homes!'"
**Scene:** `Tiny Chiku the mouse standing bravely on a small rock, looking up and speaking politely to the huge gentle Bula who lowers her head kindly to listen. Big-and-small contrast, warm and tender. Mood: courage and gentleness.`

### Page 4 — `ele_04_bula_agrees.png`  (Bula + Chiku)
**Text:** "'Of course,' smiled Bula, and led the herd a gentler way."
**Scene:** `Bula the elephant smiling warmly and turning to lead the herd along a different soft path around the temple, little Chiku watching gratefully from the stones. Golden light. Mood: kindness, relief.`

### Page 5 — `ele_05_grateful_promise.png`  (Bula + Chiku)
**Text:** "'If ever you need us, we will help you!' promised the little mice."
**Scene:** `A small cluster of cheerful mice led by Chiku waving up at the kind Bula, who looks gently amused — how could such tiny friends help? Warm friendly scene by the temple. Mood: heartfelt, hopeful.`

### Page 6 — `ele_06_elephants_caught.png`  (Bula)
**Text:** "Many days later, big ropes from hunters caught the elephants near the lake."
**Scene:** `Bula and a few elephants gently tangled in large soft hunter's ropes near the lotus lake, looking worried but unharmed and not frightening — soft and storybook, no blood, no people. Muted evening light. Mood: gentle worry, a problem to solve.`

### Page 7 — `ele_07_mice_gnaw.png`  (Bula + Chiku)
**Text:** "The mice came running! Nibble, nibble, nibble through the ropes."
**Scene:** `The whole mouse colony, led by busy Chiku, swarming kindly over the big ropes and nibbling them apart while Bula watches with hopeful grateful eyes. Teamwork, warm and lively. Mood: hope, busy kindness.`

### Page 8 — `ele_08_free_friends.png`  (Bula + Chiku)
**Text:** "The ropes fell away. Big and small — friends forever!"
**Scene:** `Bula the elephant free and joyful, gently lowering her trunk to little Chiku and the mice in thanks, warm sunset glow over the lotus lake and temple. Everyone happy together. Mood: warm triumph, friendship.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Bula and Chiku identical to their character sheets across every image
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate; animals gentle and friendly
- [ ] Anatomy clean — no extra limbs, distorted faces, or artifacts
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries (add to `cast_manifest.json` at repo root)

```json
{
  "bula":  { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Elephant — review all 8 scenes" },
  "chiku": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Mouse — review all 8 scenes" }
}
```

Both must be `approved: true` before the story can open — `validateStoryCast()`
throws `CastNotApprovedException` at load otherwise (FV-001 safety gate).

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Ensure `pubspec.yaml` declares `    - assets/packs/images/` under flutter assets.
3. Move `pack.json` (this folder) to `assets/packs/eltmice.json`.
4. Add `bula: true` and `chiku: true` to the runtime approval map for `loadPack(...)`.
5. The parent "what your child practised" summary fills in from `learningGoal`.
   (Mode B has no coping cards, so that section is simply omitted.)
