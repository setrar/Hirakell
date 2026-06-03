
To save your Euterpea creation to a standard MIDI file instead of playing it live, you use the **`writeMidi`** function.

Its syntax is quite simple: `writeMidi "filename.mid" musicTrack`.

However, because we defined our helper function `fn` inside a local `let` block, we need to make sure the music track variable name is defined properly before feeding it into `writeMidi`.

Here is the exact code to type into GHCi to compile the scale into a variable named `bebopTune` and save it to a file:

```haskell
:{
let { fn (n1,o1, n2,o2) = n1 o1 qn :=: n2 o2 qn;
bebopTune = line (map fn [(c,3, e,4), (d,3, f,4), (e,3, g,4), (f,3, af,4), (g,3, a,4), (af,3, b,4), (a,3, c,5), (b,3, d,5), (c,4, e,5)]) }
in writeMidi "bebop_scale.midi" bebopTune
:}

```

### What this does:

1. It defines your dynamic octave function `fn`.
2. It processes your entire C Bebop Major list into a single track called `bebopTune`.
3. It creates a file named **`bebop_scale.mid`** in your current working directory.

You can then find that file on your computer and open it with any DAW, MIDI player, or sheet music editor!
