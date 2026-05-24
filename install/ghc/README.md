# ghc on Mac Silicon

Fantastic! Hearing that synth fire up on an Apple Silicon Mac after battling those legacy constraints is incredibly satisfying.

Here is a quick recap of how we bypassed the C-compiler errors and successfully got **Euterpea2** running natively on your ARM Mac:

---

## 🛠️ The Euterpea2 Apple Silicon Fix Recap

The installation of older computer music libraries fails on modern Macs because core dependencies like `PortMidi-0.2.0.0` hardcode Intel-specific CPU instructions (`-msse2`) and use older CoreMIDI data configurations.

### 1. Fix the Local Environment

Modern GHC installations on macOS often cross-wire into a Homebrew-installed version of GNU `gcc` that breaks Apple’s specific compilation syntax. We fixed this by forcing our active terminal session to prioritize native Apple paths:

```bash
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

```

### 2. Bypass Hardcoded Intel Instructions

Because `PortMidi-0.2.0.0` was written before Apple Silicon existed, it forcefully pushes Intel flags into `hsc2hsc` during configuration, causing Apple Clang to crash. To resolve this:

* We ran `cabal unpack PortMidi-0.2.0.0`.
* Opened `PortMidi-0.2.0.0/PortMidi.cabal` and completely **deleted** the line: `cc-options: -msse2`.

### 3. Handle Legacy C Pointers vs. Integers

Modern macOS SDKs treat CoreMIDI types (`MIDIClientRef`, `MIDIPortRef`) as numbers rather than pointers, causing a strict typing failure when initialized to `NULL`.

* We updated the project constraints by adding a `cabal.project` file to the root folder:
```cabal
packages:
  .
  ./PortMidi-0.2.0.0

```


* We executed the final install using a Clang flag that forces the compiler to treat those type-mismatches as minor warnings instead of catastrophic blockages:
```bash
cabal install --lib --allow-newer --ghc-options="-optc-Wno-error=int-conversion"

```



---

### 🎼 Reminder: Making Music in GHCi

When jumping into GHCi to test it out, always remember to execute your shell **outside** of your cloned repo folder so GHCi hooks into the global library space instead of the raw `.lhs` text files:

```bash
cd ..  # Step out of the repo folder
ghci

```

```haskell
ghci> import Euterpea
ghci> let melody = c 4 qn :+: e 4 qn :+: g 4 qn :+: c 5 hn
ghci> play melody

```

Enjoy coding your music!
