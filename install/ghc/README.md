# ghc on Mac Silicon


## 🛠️ The Euterpea2 Apple Silicon Fix Recap

The installation of older computer music libraries fails on modern Macs because core dependencies like `PortMidi-0.2.0.0` hardcode Intel-specific CPU instructions (`-msse2`) and use older CoreMIDI data configurations.

```bash
git clone https://github.com/Euterpea/Euterpea2.git && cd Euterpea2
```

### 0. Setup

- [ ] `GHC` version is `9.10.3` when using [ghcup](https://www.haskell.org/ghcup/)

```bash
ghcup list | grep ✔✔
```
```lua
✔✔ cabal 3.10.3.0                                        
✔✔ ghc   9.10.3      base-4.20.1.0                       
✔✔ ghcup 0.2.5.0     latest,recommended                  
✔✔ stack 2.15.5
```

- [ ] On Mac 🍎 Silicon, check `gcc` version is Mac's, i.e. not GNU

```
gcc --version
```
```lua
Apple clang version 17.0.0 (clang-1700.6.3.2)
Target: arm64-apple-darwin25.5.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```

💡 use `export PATH=/usr/bin:$PATH` if not sure

### 1. [PortMidi-haskell](https://github.com/PortMidi/PortMidi-haskell) - Bypass Hardcoded Intel Instructions

Because `PortMidi-0.2.0.0` was written before Apple Silicon existed, it forcefully pushes Intel flags into `hsc2hsc` during configuration, causing Apple Clang to crash. To resolve this:

* Run `cabal unpack PortMidi-0.2.0.0` -> This will download the `PortMidi-0.2.0.0` source code
* Open `PortMidi-0.2.0.0/PortMidi.cabal` and completely **deleted** the line: `cc-options: -msse2`  or use `sed -i '' '/cc-options:.*-msse2/d' PortMidi-0.2.0.0/PortMidi.cabal` (on MacOS)

### 3. Handle Legacy C Pointers vs. Integers

Modern macOS SDKs treat CoreMIDI types (`MIDIClientRef`, `MIDIPortRef`) as numbers rather than pointers, causing a strict typing failure when initialized to `NULL`.

* We updated the project constraints by adding a `cabal.project` file to the root folder:
```cabal
packages:
  .
  ./PortMidi-0.2.0.0

package PortMidi
  ghc-options: -optc-Wno-error=int-conversion -optc-Wno-error=implicit-function-declaration
```


* We executed the final install using a Clang flag that forces the compiler to treat those type-mismatches as minor warnings instead of catastrophic blockages:
```bash
cabal install --lib --allow-newer 

```
<details><summary>🪵 Log</summary>

```lua

Wrote tarball sdist to
/Users/valiha/Developer/Euterpea2/dist-newstyle/sdist/Euterpea-2.0.8.tar.gz
Wrote tarball sdist to
/Users/valiha/Developer/Euterpea2/dist-newstyle/sdist/PortMidi-0.2.0.0.tar.gz
Resolving dependencies...
Build profile: -w ghc-9.4.8 -O1
In order, the following will be built (use -v for more details):
 - PortMidi-0.2.0.0 (lib:PortMidi) (requires build)
 - Euterpea-2.0.8 (lib:Euterpea) (requires build)
Starting     PortMidi-0.2.0.0 (all, legacy fallback)
Building     PortMidi-0.2.0.0 (all, legacy fallback)
Installing   PortMidi-0.2.0.0 (all, legacy fallback)
Completed    PortMidi-0.2.0.0 (all, legacy fallback)
Starting     Euterpea-2.0.8 (all, legacy fallback)
Building     Euterpea-2.0.8 (all, legacy fallback)
Installing   Euterpea-2.0.8 (all, legacy fallback)
Completed    Euterpea-2.0.8 (all, legacy fallback)
```

</details>



---

### 🎼 Reminder: Making Music in GHCi

When jumping into GHCi to test it out, always remember to execute your shell **outside** of your cloned repo folder so GHCi hooks into the global library space instead of the raw `.lhs` text files:

```bash
cd ..  # Step out of the repo folder
ghci

```

```haskell
ghci> import Euterpea
ghci> devices

Input devices: 
  InputDeviceID 0	IAC Driver Bus 1
  InputDeviceID 1	Network RTP Session 1
  InputDeviceID 2	UMP Network Network MIDI 2.0 Session 1
  InputDeviceID 3	FP-30 Bluetooth

Output devices: 
  OutputDeviceID 4	IAC Driver Bus 1
  OutputDeviceID 5	Network RTP Session 1
  OutputDeviceID 6	UMP Network Network MIDI 2.0 Session 1
  OutputDeviceID 7	FP-30 Bluetooth

ghci> let melody = c 4 qn :+: e 4 qn :+: g 4 qn :+: c 5 hn
ghci> play melody
ghci> :q
```

Enjoy coding your music!
