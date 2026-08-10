# What is voice leading?

## **Voice leading** (or *part writing*) is the art of moving individual melodic lines ("voices") smoothly from one chord to the next.

Rather than treating chords as big, isolated blocks that jump around the instrument, voice leading focuses on how each note within a chord travels to its target note in the subsequent chord.

---

### The Fundamental Rule: Minimal Motion

The primary goal of smooth voice leading is to **minimize the distance each individual voice has to move**.

* **Keep common tones:** If two adjacent chords share the same note, keep that note in the same voice/register.
* **Move by step:** Non-shared notes should move by the smallest possible step (a half-step or whole-step).
* **Avoid large leaps:** Avoid jumping large intervals within a single inner voice unless necessary for structural reasons.

---

### Example: Poor vs. Smooth Voice Leading

Consider playing a simple **$\text{C}$ major** ($\text{C} - \text{E} - \text{G}$) to an **$\text{F}$ major** ($\text{F} - \text{A} - \text{C}$) chord progression on a piano:

* **Poor Voice Leading (Parallel Jumping):**
* Chord 1: $[\text{C}_4, \text{E}_4, \text{G}_4]$
* Chord 2: $[\text{F}_4, \text{A}_4, \text{C}_5]$
* *Result:* Every note jumps up by a 4th. It sounds choppy and disconnected because the entire block moves together.


* **Smooth Voice Leading (Inversions & Common Tones):**
* Chord 1: $[\text{C}_4, \text{E}_4, \text{G}_4]$
* Chord 2: $[\text{C}_4, \text{F}_4, \text{A}_4]$ (2nd inversion $\text{F}$)
* *Result:* The $\text{C}$ stays completely stationary (common tone), while $\text{E}$ glides up a half-step to $\text{F}$, and $\text{G}$ steps up a whole-step to $\text{A}$. The transition feels seamless.



---

### Guide Tones & Tendency Tones

In functional harmony and jazz, voice leading is driven by **tendency tones**—notes that inherently create harmonic tension and demand to resolve in a specific direction:

```
[ G7 Chord ]            [ Cmaj7 Chord ]
  B (3rd)     =======>    C (Root)    (Half-step UP)
  F (7th)     =======>    E (3rd)     (Half-step DOWN)

```

The 3rd and 7th of a dominant chord (the **guide tones**) form a unstable **tritone**. In smooth voice leading, the 3rd steps **up** by half-step to become the root/5th of the tonic, while the 7th steps **down** by half-step to become the 3rd. This small, inward half-step motion is what creates the sensation of a "satisfying resolution."

---

### Applications Across Genres

* **Classical Counterpoint:** Strict rules govern voice leading (e.g., prohibiting parallel 5ths and octaves) to keep distinct vocal lines independent in choral and orchestral writing.
* **Jazz Piano & Guitar:** Musicians use smooth voice leading to construct close-position rootless voicings, allowing complex altered chords to flow effortlessly without jumping across the neck or keyboard.
* **Voice Leading in Post-Tonal Theory:** Theorists like Richard Cohn (Neo-Riemannian theory) measure voice leading using pitch-class distance, evaluating how efficiently one pitch-class set transforms into another using minimal semitone movement.

## What is Neo-Riemannian theory and how does it measure smooth voice leading between pitch class sets?

**Neo-Riemannian Theory (NRT)** is an approach to music theory that explains how major and minor triads connect smoothly without relying on a central key center or functional harmony ($\text{I}-\text{IV}-\text{V}$).

Popularized in the 1980s and 1990s by theorists like **Richard Cohn** and **David Lewin**, NRT uses **pitch-class sets** and **parsimonious voice leading**—a method of measuring how chords transform into one another by moving the absolute minimum number of semitones.

---

### The Three Basic Triadic Transformations

NRT focuses primarily on major and minor triads (Forte set **3-11**). It connects them using three basic transformations—**P**, **L**, and **R**—where **two notes remain identical (common tones)** and only **one note moves by 1 or 2 semitones**.

```
         [ P ]  (Parallel)  ==> Moves 1 semitone (3rd changes)
C Major <
         [ L ]  (Leittonwechsel) ==> Moves 1 semitone (Root/5th change)
   |
   +---->[ R ]  (Relative) ==> Moves 2 semitones (Root/5th change)

```

1. **P (Parallel):** Connects a major and minor triad sharing the same root (e.g., C major $\leftrightarrow$ C minor).
* $\text{C major } \{0, 4, 7\} \longrightarrow \text{C minor } \{0, 3, 7\}$
* **Voice Leading Cost:** $1$ semitone ($4 \to 3$). Common tones: $\{0, 7\}$.


2. **L (*Leittonwechsel* / Leading-Tone Exchange):** Connects a major triad to a minor triad a major 3rd above (e.g., C major $\leftrightarrow$ E minor).
* $\text{C major } \{0, 4, 7\} \longrightarrow \text{E minor } \{4, 7, 11\}$
* **Voice Leading Cost:** $1$ semitone ($0 \to 11$). Common tones: $\{4, 7\}$.


3. **R (Relative):** Connects a relative major and minor pair (e.g., C major $\leftrightarrow$ A minor).
* $\text{C major } \{0, 4, 7\} \longrightarrow \text{A minor } \{9, 0, 4\}$
* **Voice Leading Cost:** $2$ semitones ($7 \to 9$). Common tones: $\{0, 4\}$.



---

### How NRT Measures Smooth Voice Leading

In traditional harmony, moving from **C major** to **A**$\flat$**minor** feels distant and unrelated because they share no key signature. In NRT, voice leading efficiency is measured by calculating the total **semitone displacement distance** across pitch classes.

NRT shows that C major and A$\flat$ minor are actually connected by a tight, hyper-smooth chain of single-semitone steps called **compound transformations**:

$$\text{C Major } \{0, 4, 7\} \xrightarrow{\quad \mathbf{L} \quad} \text{E Minor } \{4, 7, 11\} \xrightarrow{\quad \mathbf{P} \quad} \text{E Major } \{4, 8, 11\} \xrightarrow{\quad \mathbf{L} \quad} \text{A}\flat\text{ Minor } \{8, 11, 3\}$$

* **Step 1 ($\mathbf{L}$):** $\{0, 4, 7\} \to \{11, 4, 7\}$ (1 semitone shifted)
* **Step 2 ($\mathbf{P}$):** $\{11, 4, 7\} \to \{11, 4, 8\}$ (1 semitone shifted)
* **Step 3 ($\mathbf{L}$):** $\{11, 4, 8\} \to \{11, 3, 8\}$ (1 semitone shifted)

**Total Voice-Leading Distance:** Just **3 semitones** of total motion.

---

### The Tonnetz (Tone Network)

To visualize these transformations spatially, NRT uses a two-dimensional grid called the **Tonnetz** (originally created by Leonhard Euler and expanded by Hugo Riemann).

In a Tonnetz diagram, pitch classes are laid out so that:

* Horizontal lines represent **minor 3rds** (IC 3).
* Vertical/Diagonal lines represent **major 3rds** (IC 4) and **perfect 5ths** (IC 5).
* Every major and minor triad forms a small **triangle**. Moving between adjacent triangles represents an $\mathbf{P}$, $\mathbf{L}$, or $\mathbf{R}$ transformation with minimal geometric displacement.

---

### Why NRT is Popular Today

* **Late-Romantic Classical Music:** Explains non-functional progressions in the music of Franz Liszt, Richard Wagner, and Gustav Mahler, where major/minor triads slide smoothly into each other without cadence functions.
* **Film Scoring:** Modern film composers (such as John Williams and Hans Zimmer) rely heavily on NRT compound transformations—like **$\text{LP}$** (e.g., C major to E major, the "imperial/heroic" chromatic mediant)—to create sudden emotional shifts while maintaining smooth acoustic continuity.

