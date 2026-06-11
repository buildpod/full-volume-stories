# Story Package — "Sharing My Toys"

**Mode:** A (neurodivergent / social story) · **Template:** firstThen · **Pages:** 8
**Pack id:** `pack_sharing` · **SKU:** `sku_sharing_001` · **Cast id:** `leo`, `friend`
**Intended use:** Premium library story.

This is a complete, ready-to-produce package: story script, character sheet,
locked style block, eight paste-ready image prompts, the matching pack JSON
(`pack.json` in this folder), and the human-review + wiring steps required by the
child-safety gate.

> **How this flows through Antigravity:** paste each prompt below into your
> Antigravity image-generation step (Gemini 3 Pro Image / "Nano Banana Pro"),
> generate **build-time only**, and write every output into `/review_queue/`.
> Nothing reaches a child until it passes the checklist and `cast_manifest.json`
> marks `leo` and `friend` as `approved: true`.

---

## 1. Story intent (why this story exists)

A social story that teaches a child to **wait for their turn and share toys
using a visual timer**. Turn-taking is a common source of frustration.
Arc: playing happily → friend asks to share → feeling protective/frustrated →
coping strategy (timer + counting to five) → getting the toy back → mastery.
First/then structure throughout, low-arousal art, one waiting coping card.

**learningGoal (parent summary, shown after the story):**
> "Learning to wait for a turn to play with a favorite toy, and using a timer to help the waiting feel easier."

---

## 2. Character sheet — "Leo" and "Friend" (one-off, this pack only)

> Paste this block into **every** scene prompt unchanged. One-off character:
> they only need to be consistent **within** this pack, not across other stories.

```
CHARACTER "Leo" (keep identical in every image):
A gentle 4-year-old boy. Soft round face, warm light-brown skin, rosy cheeks.
Short, softly messy wavy dark-brown hair. Large calm brown eyes. Wears a
simple short-sleeved blue-and-white horizontally striped t-shirt, comfy navy shorts,
and white socks. Expressive but never exaggerated. Same hair, clothing, and proportions in
every image.

CHARACTER "Friend" (keep identical in every image where they appear):
A gentle 4-year-old child with soft beige skin, short straight sandy-blonde hair.
Wears a plain soft-orange t-shirt and light beige trousers. Gentle and friendly.
```

---

## 3. LOCKED STYLE BLOCK

> Identical for all 8 images. Paste it at the **top** of every prompt. Do not
> alter wording between scenes — style consistency is the whole point.

```
STYLE (locked):
Soft 2D anime illustration, slice-of-life, in the gentle register of
"A Silent Voice" (Kyoto Animation). Warm dark-brown line art — never pure black —
clean with a soft edge. Flat, simple cel shading, minimal gradients. Muted warm
pastel palette: cream and oatmeal walls, soft sage and dusty-blue accents, warm
honey-wood tones. Soft, even natural daylight with gentle shadows. Calm,
uncluttered, LOW-AROUSAL composition: a SINGLE clear focal subject (or two gentle kids) with
generous soft negative space. Wholesome, child-safe, ages 3-6. Absolutely NO
text, letters, numbers, logos, or signage anywhere in the image. Square 1:1,
1024x1024.
```

**Per-image prompt = LOCKED STYLE BLOCK + CHARACTER sheets + the Scene line below.**

---

## 4. Pages — script + image prompts

Each page lists the **on-screen narration** (goes in `pack.json`), the **image
filename** (matches `imageAsset`), and the **Scene** line to append to the
prompt.

### Page 1 — `leo_01_playing.png`
**Text:** "This is Leo. Leo loves playing with his red train."
**Scene:** `Leo sitting peacefully on a soft rug in a tidy playroom, playing with a chunky wooden red toy train. Gentle relaxed smile. Centered, lots of calm empty space around him. Mood: safe and happy.`

### Page 2 — `leo_02_friend_asks.png`
**Text:** "First, a friend asks for a turn with the train."
**Scene:** `Leo holding the red wooden train. The Friend is sitting nearby, gently reaching a hand out with a soft, polite expression, asking for a turn. Single focal interaction. Mood: ordinary, gentle.`

### Page 3 — `leo_03_feeling_tight.png`
**Text:** "Leo feels his hands squeeze tight. He wants to keep playing."
**Scene:** `Leo holding the red train a little closer to his chest, shoulders rising slightly, a soft uncertain and protective expression. NOT distressed or crying — gentle and child-safe. Mood: a little frustrated but tender.`

### Page 4 — `leo_04_hard_to_wait.png`
**Text:** "It is hard to wait. That is okay."
**Scene:** `Leo looking down softly, one hand resting on his knee, eyebrows gently drawn together, calm and noticing his feeling. Soft plain pastel playroom background. Mood: quiet self-awareness.`

### Page 5 — `leo_05_timer.png`
**Text:** "First, we set a little visual timer."
**Scene:** `Leo looking calmly at a simple visual timer (like a small sand-timer or a round colorful clock with no numbers) resting on a low wooden table. Plenty of gentle negative space. Mood: calming, structured.`

### Page 6 — `leo_06_counting.png`  ← coping card page (`card_count_five`)
**Text:** "Then, I count to five slowly while the friend plays."
**Scene:** `Leo holding up one hand, looking at his fingers gently to count, peaceful expression. In the soft background, the Friend is quietly playing with the red train. A soft warm glow around Leo. Mood: calming, reassuring.`

### Page 7 — `leo_07_timer_done.png`
**Text:** "The timer goes ding! It is Leo's turn again."
**Scene:** `The Friend gently handing the red wooden train back to Leo. Leo has a soft content smile, reaching out to take it. Warm soft light. Mood: settled, fair, comfortable.`

### Page 8 — `leo_08_proud.png`
**Text:** "I did it. I shared and waited for my turn."
**Scene:** `Leo sitting happily with the red train, a gentle proud smile. The Friend is nearby looking happy too. Calm and cooperative. Mood: quiet pride and mastery.`

---

## 5. Coping card (in `pack.json`)

```
card_count_five — "Count to five"
  1. Hold up one hand with all five fingers.
  2. Put one finger down and say one.
  3. Put the next finger down and say two.
  4. Keep counting slowly until all fingers are down.
  5. Say 'I am good at waiting!'
```

---

## 6. Per-image REVIEW CHECKLIST (child-safety gate)

Run **every** image through this before approval. Any unchecked box = reject &
regenerate.

- [ ] Matches the locked style (warm brown outline — not black, muted pastels, flat shading)
- [ ] Characters are identical to the character sheet (hair, clothing, proportions)
- [ ] Low-arousal, calm — **no distress, anger, fear, or scary content**
- [ ] **No text, letters, numbers, logos, or signage** anywhere in the image (even on the timer)
- [ ] Child-safe & age-appropriate; no unsafe objects
- [ ] Anatomy clean — no extra limbs/fingers, no distorted hands or faces, no artifacts
- [ ] AI-disclosure watermark present (SynthID / C2PA) per store policy for kids' apps
- [ ] Filename exactly matches the `imageAsset` in `pack.json`

---

## 7. Cast manifest entry (create / update `cast_manifest.json` at repo root)

```json
{
  "leo": {
    "approved": false,
    "reviewedBy": "",
    "reviewedDate": "",
    "notes": "Awaiting human review of all 8 scenes in /review_queue/"
  },
  "friend": {
    "approved": false,
    "reviewedBy": "",
    "reviewedDate": "",
    "notes": "Awaiting human review"
  }
}
```

---

## 8. Wiring it into the app (after approval)

1. Move the 8 approved PNGs from `/review_queue/` into `assets/packs/images/`.
2. Move `pack.json` (this folder) to `assets/packs/sharing.json`.
3. Add `leo: true` and `friend: true` to the runtime approval map.
