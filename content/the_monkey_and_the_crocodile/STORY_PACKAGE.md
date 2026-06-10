# Story Package — "The Monkey and the Crocodile"

**Mode:** B (general narrative) · **Template:** narrative · **Pages:** 8
**Pack id:** `pack_monkeycroc` · **SKU:** `sku_monkeycroc_001` · **Cast ids:** `rakta`, `karala`
**Source:** Adapted from the Panchatantra fable *"The Monkey and the Crocodile."*
A faithful, child-safe retelling — the betrayal plot about eating the monkey's heart is entirely removed. The monkey just wants to go back to safety, and uses a clever "I left my apples" trick. Both part ways safely.

---

## 1. Story intent & moral

A warm, gently funny fable about **quick thinking and presence of mind**. The monkey realizes he shouldn't be so far from home on the river, so he tricks his slow-thinking friend into taking him back.
Moral: *Cleverness and presence of mind can get you safely home.*

**learningGoal (parent summary, shown after the story):**
> "Presence of mind and quick thinking can get you out of tricky situations."

This is **Mode B**: warmer, more engaging register, faster pacing, autoplay on. No coping cards.

---

## 2. Character sheets

```
CHARACTER "Rakta" — the clever monkey:
A small, energetic Indian macaque monkey. Warm reddish-brown fur, a long swishy tail, bright intelligent eyes. Expressive and friendly. Child-safe and storybook style. Same size, colour, and proportions in every image.
```

```
CHARACTER "Karala" — the slow-thinking crocodile:
A very large, bumpy green river crocodile. He looks friendly and a bit goofy, never scary or menacing. Wide, toothy but gentle smile. Huge next to the monkey. Same green scales and proportions in every image.
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

### Page 1 — `monkey_01_tree.png` (Rakta)
**Text:** "Rakta the monkey lived in a tall, sweet rose-apple tree."
**Scene:** `Rakta the reddish-brown monkey sitting happily high up in a lush green rose-apple tree, holding a round pinkish-red apple. Warm sunlight filtering through the leaves. Mood: peaceful, happy.`

### Page 2 — `monkey_02_sharing.png` (Rakta + Karala)
**Text:** "He shared his sweet apples with Karala, the friendly crocodile."
**Scene:** `Rakta the monkey hanging by his tail from a low branch, kindly handing a pinkish-red apple to Karala the big goofy green crocodile who is waiting gently in the blue river below. Mood: friendship, sharing.`

### Page 3 — `monkey_03_invite.png` (Rakta + Karala)
**Text:** "One day, Karala said, 'My family wants to meet you! Come across the river!'"
**Scene:** `Karala the big crocodile looking up excitedly at Rakta the monkey in the tree, inviting him. The monkey looks curious and friendly. The broad blue river stretches out. Mood: an exciting invitation.`

### Page 4 — `monkey_04_riding.png` (Rakta + Karala)
**Text:** "Rakta hopped onto the crocodile's wide, bumpy back."
**Scene:** `Rakta the monkey sitting comfortably and bravely on the broad green bumpy back of Karala the crocodile, as they start to swim gently across the river. Mood: adventure.`

### Page 5 — `monkey_05_worried.png` (Rakta + Karala)
**Text:** "But the river was wide, and Rakta felt a little worried."
**Scene:** `Rakta the monkey sitting on Karala's back, now far from the shore. The monkey looks around at the wide water and seems a little hesitant and nervous. Karala just keeps swimming goofily. Mood: slight worry, realizing a mistake.`

### Page 6 — `monkey_06_clever.png` (Rakta + Karala)
**Text:** "He thought quickly. 'Oh no, I left my best apples in the tree!' he said."
**Scene:** `Rakta the monkey looking suddenly bright and clever, tapping his head with one paw while talking to Karala. Karala the crocodile looks back with a goofy, surprised expression. Mood: a clever idea.`

### Page 7 — `monkey_07_swimming_back.png` (Rakta + Karala)
**Text:** "The silly crocodile swam all the way back to the shore."
**Scene:** `Karala the crocodile swimming happily back toward the lush green shore and the big tree, with Rakta sitting on his back looking very relieved. Warm sunlight. Mood: relief, heading home.`

### Page 8 — `monkey_08_safe.png` (Rakta + Karala)
**Text:** "Rakta jumped up safely, waving goodbye to his silly friend."
**Scene:** `Rakta the monkey safely back high up in the branches of his tree, waving down with a gentle smile to Karala the crocodile, who waves a goofy paw from the water. Both are happy and safe. Mood: safe at home, happy ending.`

---

## 5. Per-image REVIEW CHECKLIST (child-safety gate)

- [ ] Matches locked style (warm brown outline — not black, warm-muted palette, soft shading)
- [ ] Rakta and Karala identical to character sheets across every image
- [ ] Warm and engaging but **calm — no fear, no menace, no hunters/people shown, no harm**
- [ ] The crocodile is never scary; the monkey is never in genuine danger
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image
- [ ] Child-safe & age-appropriate; animals gentle and friendly
- [ ] AI-disclosure watermark present (SynthID / C2PA)
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 6. Cast manifest entries

```json
{
  "rakta": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Monkey — review all 8 scenes" },
  "karala": { "approved": false, "reviewedBy": "", "reviewedDate": "", "notes": "Crocodile — review all 8 scenes, ensure not scary" }
}
```

---

## 7. Wiring it in (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` to `assets/packs/monkeycroc.json`.
3. Add `rakta: true` and `karala: true` to the runtime approval map.
