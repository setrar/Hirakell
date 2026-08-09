# :shipit: Pitch-Classes


***Composition with Pitch-Classes: A Theory of Compositional Design*** (Yale University Press, 1987) by Robert D. Morris is a foundational landmark in post-tonal music theory and serialization. Grounded in pitch-class set theory, the text serves as both an analytical reference and a framework for generative compositional techniques.

---

**Core Concepts & Architecture**

* **Musical Spaces:** Morris categorizes musical relationships across distinct spaces—ranging from abstract pitch-class space ($\text{pc-space}$) to contour space ($\text{c-space}$) and ordered pitch space.
* **Operations & Transformations:** Formalizes operations beyond standard transposition ($T_n$) and inversion ($I$), including multiplication ($M_5$, $M_7$), generalized interval systems, and affine transformations.
* **Compositional Designs:** Introduces abstract matrix structures, arrays, and two-dimensional grids that allow composers to map pitch-class sets into realized counterpoint and time-point networks.
* **Combinatoriality & Invariance:** Expands Milton Babbitt’s concepts of hexachordal combinatoriality and structural invariance into generalized methods for multi-aggregate structures.

---

**Key Theoretical Contributions**

| Feature | Description |
| --- | --- |
| **P-Space vs. PC-Space Mapping** | Systematizes the rules for transforming abstract modulo-12 integer sets into actual pitch registers and durations. |
| **Subgroup Systems (SGs)** | Refines equivalences by allowing pitch-class sets to be evaluated under restricted operational groups (e.g., $T_n$-only without inversion). |
| **Contour Matrices (C-Matrices)** | Formulates relative height relationships ($<$, $>$, $=$) to structure melodic contour independently of specific intervals. |

---

## :one: Is this related to the midi pitch class system? 0-127 and 0-11?

**Yes, they share the exact same underlying logic.** Both system models treat the 12 semi-tones of equal temperament as integers ($0$ through $11$), but they apply this math for different purposes.

The helix diagram below shows how pitch class (chroma) loops endlessly in a circle, while specific pitches (height) stack linearly upward across octaves.

<image src=images/Pitch-Class-Circle-A-and-a-helix-representation-of-the-relation-between-Pitch-Height.webp width=50% height=50% > </images>
> Pitch class circle versus pitch height. Source: ResearchGate [^1]


---

**Pitch vs. Pitch-Class**

* **Pitch Space (MIDI 0–127):** Tracks precise register and octave height. MIDI pitch `60` is specifically Middle C (C4), while `72` is C5.
* **Pitch-Class Space (0–11):** Ignores octave height and instrument register entirely. Every C across all octaves ($C_0, C_1, C_4, C_8$) maps to the single pitch-class **0**.

---

**The Mathematical Bridge**

To convert a specific MIDI note number into a pitch class, you apply **modulo 12 arithmetic**:

$$\text{Pitch Class} = \text{MIDI Note Number} \pmod{12}$$

* **MIDI Note 60** (Middle C): $60 \pmod{12} = \mathbf{0}$
* **MIDI Note 69** (A4 / 440 Hz): $69 \pmod{12} = \mathbf{9}$
* **MIDI Note 70** (A♯4 / Bb4): $70 \pmod{12} = \mathbf{10}$ (often written as **t** in set theory)
* **MIDI Note 71** (B4): $71 \pmod{12} = \mathbf{11}$ (often written as **e** in set theory)

While MIDI uses 0–127 to trigger explicit notes on a hardware synthesizer, music theorists like Robert Morris use 0–11 to analyze underlying harmonic shapes, interval patterns, and symmetrical structures regardless of where or how high they are played.

## 2️⃣ In Haskell

In Haskell, you represent this mapping cleanly using standard type classes and the `mod` function.

**Module Definition**

```haskell
module PitchClass where

-- | Pitch class integer representation (0 through 11)
type PitchClass = Int

-- | Convert a MIDI pitch number (0..127) to a PitchClass (0..11)
toPitchClass :: Int -> PitchClass
toPitchClass midi = midi `mod` 12

-- | Standard note names indexed 0 through 11
noteNames :: [String]
noteNames = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]

-- | Convert a MIDI pitch directly to its note name string
toNoteName :: Int -> String
toNoteName midi = noteNames !! toPitchClass midi

```

---

**Defining a Custom Datatype**

For stronger type safety, you can model pitch classes as an explicit algebraic data type with built-in instances:

```haskell
data Pitch
  = C  | Cs | D  | Ds | E  | F 
  | Fs | G  | Gs | A  | As | B
  deriving (Eq, Show, Enum, Bounded)

-- | Convert MIDI integer to typed Pitch value
midiToPitch :: Int -> Pitch
midiToPitch midi = toEnum (midi `mod` 12)

```

---

**Example Usage in GHCi**

```haskell
ghci> toPitchClass 60
0

ghci> toNoteName 69
"A"

ghci> midiToPitch 71
B

```

## 3️⃣ Any equivalent in Euterpea?

Yes, Euterpea built these exact concepts into its core Haskell module structure. Rather than making you write conversion functions from scratch, Euterpea provides built-in type synonyms and primitive conversion functions.

---

### Euterpea's Built-In Types

In Euterpea, MIDI numbers are represented by `AbsPitch` (Absolute Pitch), which is a type synonym for `Int`.

```haskell
type AbsPitch = Int          -- MIDI pitches (0 to 127)
type Octave   = Int          -- Octave integer (e.g., 4)
data PitchClass = C | Cs | D | Ds | E | F | Fs | G | Gs | A | As | B
type Pitch    = (PitchClass, Octave) -- e.g., (C, 4)

```

---

### Core Conversion Functions

Euterpea provides built-in functions to convert between specific `Pitch` structures, raw integer pitch numbers (`AbsPitch`), and relative pitch classes.

* **`absPitch :: Pitch -> AbsPitch`**
Converts a `(PitchClass, Octave)` tuple to its MIDI number.
`absPitch (C, 4)  ==>  60`
* **`pitch :: AbsPitch -> Pitch`**
Converts a MIDI integer back into a `Pitch` tuple.
`pitch 60         ==>  (C, 4)`
* **`pc :: Pitch -> PitchClass`**
Extracts just the `PitchClass` constructor, stripping out octave data.
`pc (C, 4)        ==>  C`

---

### Working with Pitch Classes ($0$–$11$) in Euterpea

If you want to work strictly with post-tonal $0$–$11$ pitch classes, you can bridge Euterpea's types using standard Haskell functions or Euterpea's conversion utilities:

```haskell
import Euterpea

-- Convert a MIDI pitch integer to a PitchClass
midiToPC :: AbsPitch -> PitchClass
midiToPC = pc . pitch

-- Convert a PitchClass to its integer index (0..11)
pcToNum :: PitchClass -> Int
pcToNum = fromEnum

-- Convert a MIDI integer directly to a 0..11 integer
midiToPCNum :: AbsPitch -> Int
midiToPCNum ap = ap `mod` 12

```

**Usage in GHCi:**

```haskell
ghci> midiToPC 69
A

ghci> pcToNum A
9

ghci> midiToPCNum 69
9

```

## 4️⃣ Are Pitch Classes a recognized concept in the music industry?

**Yes, pitch classes are universally recognized and fundamental across the music industry**, though the specific vocabulary shifts depending on whether you are talking to software engineers, session musicians, or audio algorithm designers.

While a session musician might call it a "note name" and a software engineer might write `midi % 12`, they are relying on the exact same theoretical concept: grouping all octave equivalents ($C_0, C_1, C_2 \dots$) into a single abstraction.

---

**Where Pitch Classes Are Used in the Music Industry**

* **Music Software & Plugin Engineering (DAWs, VSTs, Web Audio)**
Audio tools use pitch classes to build transposition algorithms, auto-tune processors, and chord analyzers. When a MIDI plugin detects a chord regardless of whether it's played on a bass or a soprano synth, it relies on pitch-class set operations.
* **Audio Information Retrieval (AIR) & Music Streaming**
Companies like Spotify, Shazam, and GraceNote extract **chroma features** (a 12-element vector representing pitch-class energy) from raw audio files. Chroma profiles allow algorithms to identify song key, analyze harmonic progressions, and match cover versions of songs regardless of instrument register or tempo.
* **Digital Instruments & Algorithmic Composition**
Generative music engines, arpeggiators, and MIDI controllers rely on pitch class math ($0$–$11$) to constrain notes to specific scales, calculate inversions, or auto-generate backing harmonies in real time.
* **Film Scoring & Modern Composition**
Media composers scoring films, games, or contemporary classical works actively use pitch-class set theory (derived from theorists like Allen Forte and Robert Morris) to construct non-tonal motifs, symmetry, and atmosphere.

---

**Terminology Breakdown Across Domains**

| Industry Domain | What They Call It | Typical Representation |
| --- | --- | --- |
| **Music Theory / Academia** | Pitch Class (PC) | $0, 1, 2, \dots, 9, t, e$ |
| **Music Tech & Programming** | Chroma / Pitch Class / Modulo-12 | `int pc = midiNote % 12;` |
| **Session Musicians & Arrangers** | Pitch Class / Note Name / Key | "C", "F#", "Bb" (regardless of octave) |
| **Audio Processing (DSP)** | Chroma Vector / Chromagram | 12-bin pitch distribution array |

## 5️⃣ Why t and e ?

**`t` and `e` stand for "Ten" and "Eleven."**

They are used in music set theory as single-character symbols for pitch classes 10 and 11 to solve a formatting and parsing problem.

<image src=https://en.wikipedia.org/wiki/Forte_number#/media/File:Set_theory_3-1_in_the_chromatic_circle_fix.svg width=50% height=50% > </image>

---

### Why Single Characters Are Necessary

When music theorists write out a pitch-class set, matrix, or tone row, they list elements sequentially without punctuation (e.g., `[0 1 4 7 10 11]` or `01471011`).

If you use standard two-digit numbers, ambiguous collisions happen instantly:

* **`0110`** could mean the set **`[0, 1, 10]`** or the set **`[0, 11, 0]`**.
* **`01471011`** could be read as 8 single digits or 6 pitch classes.

By replacing 10 with **`t`** (or **`T`**) and 11 with **`e`** (or **`E`**), every pitch class from 0 to 11 occupies **exactly one character**:

| Pitch Class | Note | Symbol |
| --- | --- | --- |
| **10** | A♯ / B♭ | **`t`** (Ten) |
| **11** | B | **`e`** (Eleven) |

---

### Alternative Conventions

While `t` and `e` are the most common in American set theory (popularized by Allen Forte and John Rahn):

* **Hexadecimal:** Computer scientists and MIDI system developers sometimes use **`A`** and **`B`** (0–9, A, B), borrowed directly from base-16 math.
* **duodecim/duodecimal:** Math theorists who work in base-12 arithmetic use **`↊`** (dek) and **`↋`** (el).

# 📚 References

[^1]: https://www.researchgate.net/publication/396855966_Octave_Equivalence_Difficult_to_Perceive_but_Improvements_are_Possible_With_Training
