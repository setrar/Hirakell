# HSoM Testing

```bash
mkdir HSoM-testing
```

- [ ] Create an Haskell Project (use all default)

```bash
cabal init --interactive
```
<details><summary>🪵 Log</summary>

```lua
What does the package build:
   1) Library
 * 2) Executable
   3) Library and Executable
   4) Test suite
Your choice? [default: Executable] 
Please choose version of the Cabal specification to use:
   1) 1.24
   2) 2.0   (support for Backpack, internal sub-libs, '^>=' operator)
   3) 2.2   (+ support for 'common', 'elif', redundant commas, SPDX)
   4) 2.4   (+ support for '**' globbing)
 * 5) 3.0   (+ set notation for ==, common stanzas in ifs, more redundant commas, better pkgconfig-depends)
   6) 3.4   (+ sublibraries in 'mixins', optional 'default-language')
   7) 3.14  (+ build-type: Hooks)
Your choice? [default: 3.0] 
Package name? [default: HSoM-testing] 
Package version? [default: 0.1.0.0] 
Please choose a license:
   1) BSD-2-Clause
 * 2) BSD-3-Clause
   3) Apache-2.0
   4) MIT
   5) MPL-2.0
   6) ISC
   7) GPL-2.0-only
   8) GPL-3.0-only
   9) LGPL-2.1-only
  10) LGPL-3.0-only
  11) AGPL-3.0-only
  12) GPL-2.0-or-later
  13) GPL-3.0-or-later
  14) LGPL-2.1-or-later
  15) LGPL-3.0-or-later
  16) AGPL-3.0-or-later
  17) Other (specify)
Your choice? [default: BSD-3-Clause] 
Author name? [default: whoever] 
Maintainer email? [default: whoever@wherever.africa] 
Project homepage URL? [optional] 
Project synopsis? [optional] 
Project category:
   1) Codec
   2) Concurrency
   3) Control
   4) Data
   5) Database
   6) Development
   7) Distribution
   8) Game
   9) Graphics
  10) Language
  11) Math
  12) Network
  13) Sound
  14) System
  15) Testing
  16) Text
  17) Web
  18) Other (specify)
Your choice? [default: (none)] 
What is the main module of the executable:
 * 1) Main.hs
   2) Main.lhs
   3) Other (specify)
Your choice? [default: Main.hs] 
Application directory:
 * 1) app
   2) exe
   3) src-exe
   4) Other (specify)
Your choice? [default: app] 
Choose a language for your executable:
 * 1) Haskell2010
   2) Haskell98
   3) GHC2021 (requires at least GHC 9.2)
   4) GHC2024 (requires at least GHC 9.10)
   5) Other (specify)
Your choice? [default: Haskell2010] 
Add informative comments to each field in the cabal file. (y/n)? [default: y] 
[Info] Using cabal specification: 3.0
[Info] Creating fresh file LICENSE...
[Info] Creating fresh file CHANGELOG.md...
[Info] Creating fresh directory ./app...
[Info] Creating fresh file app/Main.hs...
[Info] Creating fresh file HSoM-testing.cabal...
[Warn] No synopsis given. You should edit the .cabal file and add one.
[Info] You may want to edit the .cabal file and add a Description field.
```

</details>

- [ ] Add custom libraries in `cabal.project`

```powershell
packages: .

source-repository-package
    type: git
    location: https://github.com/georgefst/Euterpea2
    tag: 3bbb079bf95f9c36da0bd8850313ae4a8fbee0cf

source-repository-package
    type: git
    location: https://github.com/ninioArtillero/HSoM
    tag: abac8cbd4e18381ee1d10d247521af770c4e3010

source-repository-package
    type: git
    location: https://github.com/dpwiz/PortMidi-haskell
    tag: 170187c0829283affeaffd805163d60186fb727c
```

```bash
cabal repl
```
<details><summary>🪵 Log</summary>

```lua
Cloning into '/Users/valiha/Developer/Hirakell/HSoM-testing/dist-newstyle/src/PortMidi-_-ce431d602640969aeab1aeada9b003b13fd6c13f8e33ae58b9da699bb4ec66e3'...
remote: Enumerating objects: 192, done.
remote: Counting objects: 100% (32/32), done.
remote: Compressing objects: 100% (31/31), done.
remote: Total 192 (delta 2), reused 17 (delta 1), pack-reused 160 (from 1)
Receiving objects: 100% (192/192), 185.93 KiB | 66.00 KiB/s, done.
Resolving deltas: 100% (71/71), done.
HEAD is now at 170187c Fetch new cbits from upstream
Cloning into '/Users/valiha/Developer/Hirakell/HSoM-testing/dist-newstyle/src/Euterpea2-dc39503a69bb884be28934d6bc7cdaa05607fca34d400faca7a29c6d9d050085'...
remote: Enumerating objects: 518, done.
remote: Counting objects: 100% (118/118), done.
remote: Compressing objects: 100% (25/25), done.
remote: Total 518 (delta 102), reused 93 (delta 93), pack-reused 400 (from 1)
Receiving objects: 100% (518/518), 19.05 MiB | 158.00 KiB/s, done.
Resolving deltas: 100% (227/227), done.
HEAD is now at 3bbb079 Merge pull request #3 from ninioArtillero/ninioArtillero-patch-1
Cloning into '/Users/valiha/Developer/Hirakell/HSoM-testing/dist-newstyle/src/HSoM-a46a3387b9ce33f7f38968f737138b930fb9e47c0b6c08f4bcb138d5c1949bb4'...
remote: Enumerating objects: 197, done.
remote: Counting objects: 100% (32/32), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 197 (delta 24), reused 23 (delta 20), pack-reused 165 (from 1)
Receiving objects: 100% (197/197), 4.30 MiB | 222.00 KiB/s, done.
Resolving deltas: 100% (64/64), done.
HEAD is now at abac8cb add note and override instructions
Configuration is affected by the following files:
- cabal.project
Resolving dependencies...
Build profile: -w ghc-9.12.4 -O1
In order, the following will be built (use -v for more details):
 - HSoM-testing-0.1.0.0 (interactive) (exe:HSoM-testing) (first run)
Configuring executable 'HSoM-testing' for HSoM-testing-0.1.0.0...
Preprocessing executable 'HSoM-testing' for HSoM-testing-0.1.0.0...
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
[1 of 2] Compiling Main             ( app/Main.hs, interpreted )
Ok, one module loaded.
ghci> 
```

</details>

```bash
tree dist-newstyle
```
<details><summary>🪵 Log</summary>

```lua
dist-newstyle
├── build
│   └── aarch64-osx
│       └── ghc-9.12.4
│           └── HSoM-testing-0.1.0.0
│               └── x
│                   └── HSoM-testing
│                       ├── build
│                       │   └── HSoM-testing
│                       │       ├── autogen
│                       │       │   ├── cabal_macros.h
│                       │       │   ├── PackageInfo_HSoM_testing.hs
│                       │       │   └── Paths_HSoM_testing.hs
│                       │       └── HSoM-testing-tmp
│                       ├── cache
│                       │   └── config
│                       ├── package.conf.inplace
│                       │   ├── package.cache
│                       │   └── package.cache.lock
│                       └── setup-config
├── cache
│   ├── compiler
│   ├── config
│   ├── elaborated-plan
│   ├── improved-plan
│   ├── plan.json
│   ├── solver-plan
│   ├── source-hashes
│   └── up-to-date
├── packagedb
│   └── ghc-9.12.4
│       ├── package.cache
│       └── package.cache.lock
├── src
│   ├── Euterpea2-dc39503a69bb884be28934d6bc7cdaa05607fca34d400faca7a29c6d9d050085
│   │   ├── Control
│   │   │   ├── Arrow
│   │   │   │   └── ArrowP.lhs
│   │   │   └── SF
│   │   │       └── SF.lhs
│   │   ├── Euterpea
│   │   │   ├── IO
│   │   │   │   ├── Audio
│   │   │   │   │   ├── Basics.hs
│   │   │   │   │   ├── BasicSigFuns.lhs
│   │   │   │   │   ├── CSound.lhs
│   │   │   │   │   ├── IO.hs
│   │   │   │   │   ├── Render.hs
│   │   │   │   │   └── Types.hs
│   │   │   │   ├── Audio.hs
│   │   │   │   ├── MIDI
│   │   │   │   │   ├── ExportMidiFile.lhs
│   │   │   │   │   ├── FromMidi.lhs
│   │   │   │   │   ├── FromMidi2.lhs
│   │   │   │   │   ├── GeneralMidi.hs
│   │   │   │   │   ├── MEvent.lhs
│   │   │   │   │   ├── MidiIO.lhs
│   │   │   │   │   ├── Play.lhs
│   │   │   │   │   ├── ToMidi.lhs
│   │   │   │   │   └── ToMidi2.lhs
│   │   │   │   └── MIDI.hs
│   │   │   └── Music.lhs
│   │   ├── Euterpea.cabal
│   │   ├── Euterpea.lhs
│   │   ├── License
│   │   ├── ReadMe.md
│   │   └── Setup.hs
│   ├── Euterpea2-dc39503a69bb884be28934d6bc7cdaa05607fca34d400faca7a29c6d9d050085-Euterpea-2.0.8.tar.gz
│   ├── Euterpea2-dc39503a69bb884be28934d6bc7cdaa05607fca34d400faca7a29c6d9d050085.cache
│   ├── HSoM-a46a3387b9ce33f7f38968f737138b930fb9e47c0b6c08f4bcb138d5c1949bb4
│   │   ├── HSoM
│   │   │   ├── Examples
│   │   │   │   ├── Additive.lhs
│   │   │   │   ├── AMandFM.lhs
│   │   │   │   ├── EnableGUI.hs
│   │   │   │   ├── EuterpeaExamples.lhs
│   │   │   │   ├── FFT.lhs
│   │   │   │   ├── Interlude.lhs
│   │   │   │   ├── IntervalTrainer.lhs
│   │   │   │   ├── LSystems.lhs
│   │   │   │   ├── MoreMusic.lhs
│   │   │   │   ├── MUIExamples1.lhs
│   │   │   │   ├── MUIExamples2.lhs
│   │   │   │   ├── MusicToSignal.lhs
│   │   │   │   ├── NewResolutions.lhs
│   │   │   │   ├── PhysicalModeling.lhs
│   │   │   │   ├── RandomMusic.lhs
│   │   │   │   ├── SelfSimilar.lhs
│   │   │   │   ├── SoundCheck.lhs
│   │   │   │   ├── SpectrumAnalysis.lhs
│   │   │   │   └── SSF.lhs
│   │   │   ├── MUI
│   │   │   │   └── MidiWidgets.lhs
│   │   │   ├── MUI.hs
│   │   │   └── Performance.lhs
│   │   ├── HSoM.cabal
│   │   ├── HSoM.lhs
│   │   ├── License
│   │   ├── new_code.txt
│   │   ├── README.md
│   │   ├── Setup.hs
│   │   └── System
│   │       └── Random
│   │           └── Distributions.hs
│   ├── HSoM-a46a3387b9ce33f7f38968f737138b930fb9e47c0b6c08f4bcb138d5c1949bb4-HSoM-1.0.0.tar.gz
│   ├── HSoM-a46a3387b9ce33f7f38968f737138b930fb9e47c0b6c08f4bcb138d5c1949bb4.cache
│   ├── PortMidi-_-ce431d602640969aeab1aeada9b003b13fd6c13f8e33ae58b9da699bb4ec66e3
│   │   ├── appveyor.yml
│   │   ├── CHANGELOG.md
│   │   ├── LICENSE
│   │   ├── portmidi
│   │   │   ├── license.txt
│   │   │   ├── pm_common
│   │   │   │   ├── pminternal.h
│   │   │   │   ├── pmutil.c
│   │   │   │   ├── pmutil.h
│   │   │   │   ├── portmidi.c
│   │   │   │   └── portmidi.h
│   │   │   ├── pm_linux
│   │   │   │   ├── pmlinux.c
│   │   │   │   ├── pmlinux.h
│   │   │   │   ├── pmlinuxalsa.c
│   │   │   │   ├── pmlinuxalsa.h
│   │   │   │   ├── pmlinuxnull.c
│   │   │   │   └── pmlinuxnull.h
│   │   │   ├── pm_mac
│   │   │   │   ├── pmmac.c
│   │   │   │   ├── pmmacosxcm.c
│   │   │   │   └── pmmacosxcm.h
│   │   │   ├── pm_win
│   │   │   │   ├── pmwin.c
│   │   │   │   ├── pmwinmm.c
│   │   │   │   └── pmwinmm.h
│   │   │   └── porttime
│   │   │       ├── porttime.c
│   │   │       ├── porttime.h
│   │   │       ├── ptlinux.c
│   │   │       ├── ptmacosx_cf.c
│   │   │       └── ptwinmm.c
│   │   ├── PortMidi.cabal
│   │   ├── README.txt
│   │   ├── Setup.hs
│   │   ├── Sound
│   │   │   ├── PortMidi
│   │   │   │   └── DeviceInfo.hsc
│   │   │   └── PortMidi.hs
│   │   └── stack.yaml
│   ├── PortMidi-_-ce431d602640969aeab1aeada9b003b13fd6c13f8e33ae58b9da699bb4ec66e3-PortMidi-0.2.0.0.tar.gz
│   └── PortMidi-_-ce431d602640969aeab1aeada9b003b13fd6c13f8e33ae58b9da699bb4ec66e3.cache
└── tmp

41 directories, 109 files
```

</details>

- [ ] Adding Euterpea and HSoM to the project's library (HSoM-testing.cabal)

```Haskell
build-depends:    base ^>=4.21.2.0,
                  Euterpea,
                  HSoM
```

```bash
cabal repl         
```
<details><summary>🪵 Log</summary>

```lua
Configuration is affected by the following files:
- cabal.project
Resolving dependencies...
Build profile: -w ghc-9.12.4 -O1
In order, the following will be built (use -v for more details):
 - ObjectName-1.1.0.2 (lib) (requires build)
 - PortMidi-0.2.0.0 (lib) (requires build)
 - StateVar-1.2.2 (lib) (requires build)
 - fixed-0.3 (lib) (requires build)
 - half-0.3.3 (lib) (requires build)
 - pure-fft-0.2.0 (lib:pure-fft) (requires build)
 - random-1.2.1.3 (lib) (requires build)
 - OpenGLRaw-3.3.4.1 (lib) (requires build)
 - markov-chain-0.0.3.4 (lib:markov-chain) (requires build)
 - QuickCheck-2.18.0.0 (lib) (requires build)
 - GLURaw-2.0.0.5 (lib) (requires build)
 - Stream-0.4.7.2 (lib:Stream) (requires build)
 - HCodecs-0.5.2 (lib) (requires build)
 - OpenGL-3.0.3.0 (lib) (requires build)
 - arrows-0.4.4.2 (lib:arrows) (requires build)
 - GLUT-2.7.0.16 (lib) (requires build)
 - Euterpea-2.0.8 (lib) (requires build)
 - UISF-0.4.0.0 (lib) (requires build)
 - HSoM-1.0.0 (lib) (requires build)
 - HSoM-testing-0.1.0.0 (interactive) (exe:HSoM-testing) (configuration changed)
Starting     ObjectName-1.1.0.2 (lib)
Starting     StateVar-1.2.2 (lib)
Starting     fixed-0.3 (lib)
Starting     pure-fft-0.2.0 (all, legacy fallback: cabal-version is less than 1.8)
Starting     half-0.3.3 (lib)
Starting     PortMidi-0.2.0.0 (lib)
Starting     random-1.2.1.3 (lib)
Building     pure-fft-0.2.0 (all, legacy fallback: cabal-version is less than 1.8)
Building     fixed-0.3 (lib)
Building     half-0.3.3 (lib)
Building     PortMidi-0.2.0.0 (lib)
Building     StateVar-1.2.2 (lib)
Building     ObjectName-1.1.0.2 (lib)
Building     random-1.2.1.3 (lib)
Installing   ObjectName-1.1.0.2 (lib)
Installing   pure-fft-0.2.0 (all, legacy fallback: cabal-version is less than 1.8)
Installing   StateVar-1.2.2 (lib)
Installing   fixed-0.3 (lib)
Completed    pure-fft-0.2.0 (all, legacy fallback: cabal-version is less than 1.8)
Completed    ObjectName-1.1.0.2 (lib)
Completed    StateVar-1.2.2 (lib)
Completed    fixed-0.3 (lib)
Installing   half-0.3.3 (lib)
Completed    half-0.3.3 (lib)
Starting     OpenGLRaw-3.3.4.1 (lib)
Building     OpenGLRaw-3.3.4.1 (lib)
Installing   PortMidi-0.2.0.0 (lib)
Completed    PortMidi-0.2.0.0 (lib)
Installing   random-1.2.1.3 (lib)
Completed    random-1.2.1.3 (lib)
Starting     markov-chain-0.0.3.4 (all, legacy fallback: cabal-version is less than 1.8)
Starting     QuickCheck-2.18.0.0 (lib)
Building     markov-chain-0.0.3.4 (all, legacy fallback: cabal-version is less than 1.8)
Building     QuickCheck-2.18.0.0 (lib)
Installing   markov-chain-0.0.3.4 (all, legacy fallback: cabal-version is less than 1.8)
Completed    markov-chain-0.0.3.4 (all, legacy fallback: cabal-version is less than 1.8)
Installing   QuickCheck-2.18.0.0 (lib)
Completed    QuickCheck-2.18.0.0 (lib)
Starting     Stream-0.4.7.2 (all, legacy fallback: cabal-version is less than 1.8)
Starting     HCodecs-0.5.2 (lib)
Building     HCodecs-0.5.2 (lib)
Building     Stream-0.4.7.2 (all, legacy fallback: cabal-version is less than 1.8)
Installing   Stream-0.4.7.2 (all, legacy fallback: cabal-version is less than 1.8)
Completed    Stream-0.4.7.2 (all, legacy fallback: cabal-version is less than 1.8)
Starting     arrows-0.4.4.2 (all, legacy fallback: cabal-version is less than 1.8)
Building     arrows-0.4.4.2 (all, legacy fallback: cabal-version is less than 1.8)
Installing   arrows-0.4.4.2 (all, legacy fallback: cabal-version is less than 1.8)
Completed    arrows-0.4.4.2 (all, legacy fallback: cabal-version is less than 1.8)
Installing   HCodecs-0.5.2 (lib)
Completed    HCodecs-0.5.2 (lib)
Starting     Euterpea-2.0.8 (lib)
Building     Euterpea-2.0.8 (lib)
Installing   Euterpea-2.0.8 (lib)
Completed    Euterpea-2.0.8 (lib)
Installing   OpenGLRaw-3.3.4.1 (lib)
Completed    OpenGLRaw-3.3.4.1 (lib)
Starting     GLURaw-2.0.0.5 (lib)
Building     GLURaw-2.0.0.5 (lib)
Installing   GLURaw-2.0.0.5 (lib)
Completed    GLURaw-2.0.0.5 (lib)
Starting     OpenGL-3.0.3.0 (lib)
Building     OpenGL-3.0.3.0 (lib)
Installing   OpenGL-3.0.3.0 (lib)
Completed    OpenGL-3.0.3.0 (lib)
Starting     GLUT-2.7.0.16 (lib)
Building     GLUT-2.7.0.16 (lib)
Installing   GLUT-2.7.0.16 (lib)
Completed    GLUT-2.7.0.16 (lib)
Starting     UISF-0.4.0.0 (lib)
Building     UISF-0.4.0.0 (lib)
Installing   UISF-0.4.0.0 (lib)
Completed    UISF-0.4.0.0 (lib)
Starting     HSoM-1.0.0 (lib)
Building     HSoM-1.0.0 (lib)
Installing   HSoM-1.0.0 (lib)
Completed    HSoM-1.0.0 (lib)
Configuring executable 'HSoM-testing' for HSoM-testing-0.1.0.0...
Preprocessing executable 'HSoM-testing' for HSoM-testing-0.1.0.0...
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
[1 of 2] Compiling Main             ( app/Main.hs, interpreted )
Ok, one module loaded.
ghci> 
```

</details>


```
ghci> import Euterpea
ghci> import HSoM
ghci> play $ c 4 qn
Pt_Start() called
ghci> devices

Input devices: 
  InputDeviceID 0	IAC Driver Bus 1
  InputDeviceID 1	Network RTP Session 1
  InputDeviceID 2	UMP Network Network MIDI 2.0 Session 1
  InputDeviceID 3	GarageBand Virtual Out

Output devices: 
  OutputDeviceID 4	IAC Driver Bus 1
  OutputDeviceID 5	Network RTP Session 1
  OutputDeviceID 6	UMP Network Network MIDI 2.0 Session 1
  OutputDeviceID 7	GarageBand Virtual In

ghci> play $ c 4 qn
ghci> play $ c 4 qn
Pt_Start() called
ghci> :q

```

</details>

# 📚 References

- [ ] [Installation issues on macOS Sonoma 14.5 with GHC 9.4.8 and Cabal 3.10.3.0 #59](https://github.com/Euterpea/Euterpea2/issues/59)
