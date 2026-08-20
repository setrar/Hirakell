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
