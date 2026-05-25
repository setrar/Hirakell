The code `t251.lhs` provided is written in **Literate Haskell** (`.lhs`). In a Literate Haskell file, everything is treated as a text comment by default, *unless* a line begins with a `>` character. GHC knows to only compile the lines starting with `>`.

Here is the step-by-step guide to saving, fixing, and running this file to actually hear the chords play!

---

### Step 1: Jump into Music Mode & Load GHCi

Before loading GHCi, ensure your terminal is pointing away from your GNAT compiler to Apple's native toolchain so PortMidi doesn't crash:

```bash
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
ghci t251.lhs

```

---

### Step 2: Run and Play the Music!

Once GHCi loads your file, you can interact with your functions directly from the prompt.

#### 1. Test the Exercises

Type these commands to check if the exercise calculations evaluate to `True`:

```haskell
ghci> test1
True

ghci> test2
True

```

#### 2. Play the ii-V-I Progression

Euterpea provides a built-in function called `play` that sends MIDI data straight to your Mac's default synthesizer.

To hear your chord progression, type:

```haskell
ghci> play t251

```

*(Your Mac should instantly play a D Minor chord, transitioning to a G Major chord, and resolving on a long C Major chord).*

To hear the jazzier 7th-chord version:

```haskell
ghci> play t251_

```

> ⚠️ **Troubleshooting Sound:** If you don't hear anything, make sure your Mac's system volume is up. Euterpea automatically hooks into the macOS native CoreMIDI background synth, meaning it works out of the box without needing external software.

```Haskell
dump
```

It won't print anything back on the screen, but check your terminal folder now. You will find a brand new, functional file named `t251_.midi` sitting right in the directory, ready to be dropped into GarageBand, Logic, or played with a standard media player!
