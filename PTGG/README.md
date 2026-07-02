The details of the Haskell implementation and the concept of **Chord Spaces** as specified in the framework provide a deep look into how the system functions:

### 1. Haskell Implementation Details

The Haskell implementation relies on functional concepts, custom data structures, and state management via a custom monad to stochastically generate music.

* 
**Core Data Types:** The grammar represents basic chord symbols (`CType`) and key changes/modulations (`MType`) based purely on scale degrees (written as uppercase Roman numerals to simplify the rule set).


```haskell
data CType = I | II | III | IV | V | VI | VII
  deriving (Eq, Show, Ord, Enum)

data MType = M2 | M3 | M4 | M5 | M6 | M7
  deriving (Eq, Show, Ord, Enum)

```


* 
**Sentential Forms (`Term`):** To preserve structural attributes like nesting, repetition, and modulation, the sentential forms are stored in a recursive tree data type called `Term`:


```haskell
data Term = NT Chord 
          | S [Term] 
          | Mod MType Term 
          | Let Var Term Term 
          | Var Var

```


| Term |  Meaning | 
|-|-|
|`NT` | represents a non-terminal chord.
| `S` | represents a sequence of terms.
| `Mod` | marks a section shifted to a different key.
| `Let` and `Var` | implement functional variable bindings (lexical scoping) to allow different sections of a graph grammar to point back to the same musical phrase, enabling exact structural repetitions like an **AABA** form.



**Production Rules as Functions:** Because rules are parameterized by duration (`Dur`), they are implemented directly as functions mapping a duration to a `Term`:


```haskell
data Rule = (CType, Prob) :-> RuleFun
type RuleFun = Dur -> Term

```


This functional paradigm allows rules to include **conditional logic**. For instance, a rule can dynamically choose a progression template based on whether the incoming duration is above or below a threshold (`durLimit`), seamlessly controlling the rhythmic density of the piece within the rule set itself.


* 
**The `Prog` Monad:** Since algorithmic composition requires making random choices based on rule probabilities, a custom State monad (`Prog`) threads a random number generator (`StdGen`) safely through the evaluation steps:


```haskell
newtype Prog a = Prog (StdGen -> (StdGen, a))

```


Leveraging Haskell’s **lazy evaluation**, the system feeds a monadic parallel production function into an infinite loop function (`iter`), generating a lazy list of structural iterations that are evaluated only as deep as needed.


* 
**The `expand` Stage:** Before the abstract structure can be translated into sound, a function sweeps the `Term` tree and expands the `Let` expressions, substituting `Var` terms with their bound structures under strict lexical scope.



---

### 2. Chord Spaces & Musical Interpretation

Once an abstract sequence of Roman numerals is settled, the system moves from "structural generation" to "musical interpretation" using **Chord Spaces**. A chord space groups distinct chords together via mathematical equivalence relations (reflexive, symmetric, transitive) to simplify the pathfinding required for music composition.

* 
**Equivalence Relations Used:** The system implements a generic boolean equivalence check (`EqRel a = a -> a -> Bool`) and applies it to lists of integers representing pitch values (e.g., $C=0, C\sharp=1$, etc.). It tracks four primary relations:


* 
**Octave (O):** Chords are equivalent if they share the exact same vectors of pitch classes.


* 
**Permutation (P):** Chords share the same multisets of pitches, meaning the notes are identical but rearranged across voices.


* 
**Transposition (T):** Chords share the same intervallic structure of pitches.


* 
**Cardinality (C):** Relates chords with different numbers of voices.




* **Combining Relations (OPT and OPC):**
* 
**OPT-equivalence** relates chords sharing the same intervallic pitch-class structures, which essentially defines standard chord quality (e.g., major vs. minor).


* 
**OPC-equivalence** tests if two chords share the exact same raw set of pitch classes regardless of voice count or order. This produces a finite, compact quotient space subset that is easy to navigate computationally:


```haskell
opcEq :: EqRel AbsChord
opcEq a b = f a == f b
  where f = nub . sort . map (`mod 12`)

```




* 
**Traversing Abstract to Concrete:** Mapping abstract Roman numerals to performable notes becomes a constrained pathfinding problem:


1. The abstract Roman numerals are mapped onto simple base triads matching their current key and modulation block (e.g., a `V` chord in C major maps to the pitch classes of G major: `(2, 7, 11)`).


2. The framework uses quotient spaces (implemented as a list of lists: `type QSpace a = [[a]]`) to find the equivalence class of that base triad.


3. It then searches outside the base representative set to transition to a complex "concrete" chord (a specific arrangement of integer pitches across voices, known as a **voicing**). Which concrete path is chosen is managed via a constraint satisfaction algorithm that selects for musical criteria like voice-leading smoothness (minimizing the physical distance voices must jump between chord changes).




* 
**Jazz Spaces Add-on:** To handle complex styles, a specialized "jazz space" tags chords with their musical modal context (such as the Dorian mode for a `II` chord in a major key). Instead of mapping to a simple triad, it dynamically matches a Roman numeral to several possible 4-voice seventh chords (using either the root-3rd-5th-7th or 2nd-3rd-5th-7th intervals of that mode). These block collections are subsequently passed through the OPC-space mechanism to spread them out into diverse, fluid voicings.

---

```bash
cabal build
```
<details>

```lua
Build profile: -w ghc-9.12.4 -O1
In order, the following will be built (use -v for more details):
 - ptgg-music-0.1.0.0 (exe:ptgg-music) (configuration changed)
Configuring executable 'ptgg-music' for ptgg-music-0.1.0.0...
Preprocessing executable 'ptgg-music' for ptgg-music-0.1.0.0...
Building executable 'ptgg-music' for ptgg-music-0.1.0.0...
[1 of 1] Compiling Main             ( Main.hs, dist-newstyle/build/aarch64-osx/ghc-9.12.4/ptgg-music-0.1.0.0/x/ptgg-music/build/ptgg-music/ptgg-music-tmp/Main.o ) [Source file changed]
[2 of 2] Linking dist-newstyle/build/aarch64-osx/ghc-9.12.4/ptgg-music-0.1.0.0/x/ptgg-music/build/ptgg-music/ptgg-music [Objects changed]
```

</details>

```bash
cabal run  
```

```lua
--- 1. Generated Graph Grammar AST Structure ---
S [NT (Chord (1 % 2) II),NT (Chord (1 % 2) V)]

--- 2. Flattened Structure (Variables Replaced) ---
S [NT (Chord (1 % 2) II),NT (Chord (1 % 2) V)]

--- 3. Testing Pitch Space Equivalence (Chord Spaces) ---
Success: The alternative voice belongs to the abstract C Major Chord Space!
```

```bash
cabal repl 
```
<details>

```lua
Build profile: -w ghc-9.12.4 -O1
In order, the following will be built (use -v for more details):
 - ptgg-music-0.1.0.0 (interactive) (exe:ptgg-music) (configuration changed)
Configuring executable 'ptgg-music' for ptgg-music-0.1.0.0...
Preprocessing executable 'ptgg-music' for ptgg-music-0.1.0.0...
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
[1 of 2] Compiling Main             ( Main.hs, interpreted )
Ok, one module loaded.
```

</details>

