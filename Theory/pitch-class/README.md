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

# 📚 References

[^1]: https://www.researchgate.net/publication/396855966_Octave_Equivalence_Difficult_to_Perceive_but_Improvements_are_Possible_With_Training
