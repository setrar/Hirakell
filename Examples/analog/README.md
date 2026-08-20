Here's a proper **Literate Haskell (.lhs)** version of your working Euterpea delay example, with explanations embedded in the document.

Save as **`DelayExample.lhs`**:

```lhs
This example demonstrates how to use Euterpea's built-in
`delayLine` signal processor to create a simple echo effect.

We begin by enabling Arrow notation.

> {-# LANGUAGE Arrows #-}

Import Euterpea and its audio facilities.

> import Euterpea
> import Euterpea.IO.Audio

The instrument generates a sine wave whose frequency is
determined by the pitch being played.

The signal is sent through a 0.5-second delay line and
mixed with the original signal to create an echo effect.

> instr :: Instr (Stereo AudRate)
> instr _dur ap _vol _params =
>     proc _ -> do
>         x <- oscFixed (apToHz ap) -< ()
>         y <- delayLine 0.5 -< x
>         outA -< (x + 0.5 * y, x + 0.5 * y)

Generate a WAV file containing a quarter-note middle C.

`Octave` is specified explicitly to avoid type ambiguity.

> main :: IO ()
> main =
>     writeWav
>         "delay.wav"
>         [(AcousticGrandPiano, instr)]
>         (note qn (C, 4 :: Octave))
```

### Load in GHCi

```bash
ghci -package Euterpea DelayExample.lhs
```

or

```haskell
:l DelayExample.lhs
```

### Run

```haskell
main
```

This will generate:

```text
delay.wav
```

### Key concepts

#### Arrow notation

```haskell
proc _ -> do
```

starts an Arrow computation.

#### Oscillator

```haskell
x <- oscFixed (apToHz ap) -< ()
```

creates a sine wave at the note's frequency.

#### Delay

```haskell
y <- delayLine 0.5 -< x
```

creates a delayed copy of the signal by 0.5 seconds.

#### Mixing

```haskell
outA -< (x + 0.5*y, x + 0.5*y)
```

combines the original and delayed signals into a stereo output.

### Expected result

You should hear:

1. The original note immediately.
2. A quieter echo 0.5 seconds later.
3. Output saved to `delay.wav`.

This example uses the **current Euterpea API** (`delayLine`) rather than the older `delay`-based implementation that no longer exists in your installed version.

<image src=images/delay.png width=80% height=80% > </image>

---

## ❔ What it does?

This Literate Haskell code creates a synthesized audio file using **Euterpea** (a Haskell library for computer music) and processes it through a basic delay effect.

---

### Key Components Explained

**1. Arrow Notation (`{-# LANGUAGE Arrows #-}`)**
Euterpea uses **Signal Functions** to process stream-based audio continuously. Arrow notation (`proc`, `<-`, `-<`) provides a clear, readable syntax for routing these audio streams into and out of processors, similar to wiring virtual audio cables.

**2. The Instrument Definition (`instr`)**

```haskell
instr :: Instr (Stereo AudRate)
instr _dur ap _vol _params =
    proc _ -> do
        x <- oscFixed (apToHz ap) -< ()
        y <- delayLine 0.5 -< x
        outA -< (x + 0.5 * y, x + 0.5 * y)

```

* **`apToHz ap`**: Converts the incoming pitch (Absolute Pitch) into a frequency in Hertz.
* **`x <- oscFixed ... -< ()`**: Generates a continuous sine wave tone at that frequency.
* **`y <- delayLine 0.5 -< x`**: Sends the sine wave `x` into a delay buffer that holds the audio for **0.5 seconds** before outputting it as `y`.
* **`outA -< (x + 0.5 * y, x + 0.5 * y)`**: Blends the dry signal (`x`) with the delayed signal (`y`) attenuated by 50% (`0.5 * y`). This output is sent to both left and right stereo channels.

**3. Audio Generation (`main`)**

```haskell
main :: IO ()
main =
    writeWav
        "delay.wav"
        [(AcousticGrandPiano, instr)]
        (note qn (C, 4 :: Octave))

```

* **`note qn (C, 4 :: Octave)`**: Constructs a single quarter note ($C_4$ / Middle C). `Octave` is explicitly typed to satisfy Haskell's type checker.
* **`[(AcousticGrandPiano, instr)]`**: Overrides the standard MIDI Grand Piano sound, assigning our custom synthesised delay instrument (`instr`) to play the note.
* **`writeWav "delay.wav"`**: Renders the audio stream directly to an uncompressed WAV file named `delay.wav`.

---

### What You Hear

When played, you hear a clean sine wave tone on Middle C for a quarter note, followed 0.5 seconds later by a single, quieter echo of the same tone.

### Expanding `instr`

In Euterpea, you do not call `instr` manually inside `main`. Instead, you pass `instr` as a function value within the **user-instrument map** (`[(InstrumentName, Instr a)]`), and `writeWav` handles passing the parameters automatically during rendering.

Here is how the parameters flow into `instr`:

### The Type Signature

```haskell
instr :: Instr (Stereo AudRate)

```

In Euterpea, `Instr a` is a type synonym for a function with four parameters:

```haskell
type Instr a = Dur -> AbsPitch -> Volume -> [Double] -> SignalFunction () a

```

When rewritten with its arguments, `instr` expands to:

```haskell
instr _dur ap _vol _params = proc _ -> ...

```

---

### Where Each Parameter Comes From

When `writeWav` evaluates the musical score `note qn (C, 4 :: Octave)`:

1. **`_dur` (`Dur`)**: Extracted from the note's duration, `qn` (quarter note). `writeWav` converts this musical duration into seconds based on the default tempo (120 BPM by default).
2. **`ap` (`AbsPitch`)**: Extracted from the note value, `(C, 4)`. Euterpea translates this pitch into an integer representation (Middle C / $C_4$ maps to `60`).
3. **`_vol` (`Volume`)**: Extracted from the note's velocity/volume attributes. If unspecified in the score, it defaults to a standard MIDI volume (typically `100`).
4. **`_params` (`[Double]`)**: Extracted from any extra custom parameters attached to the note event in the Euterpea `Music` structure. If none are provided, it receives an empty list `[]`.

---

### Parameter Usage in `instr`

In your specific implementation, three of the parameters are prefixed with underscores (`_dur`, `_vol`, `_params`), which tells the Haskell compiler that they are intentionally ignored:

* **Used**: `ap` is passed to `apToHz ap` to calculate the sine wave frequency in Hz ($261.63\text{ Hz}$ for $C_4$).
* **Ignored**: `_dur`, `_vol`, and `_params` are discarded because `oscFixed` produces a constant-amplitude sine wave, and signal termination is handled globally by `writeWav` once the note's duration expires.
