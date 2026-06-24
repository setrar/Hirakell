# ghc on Mac Silicon


## 🛠️ The Euterpea2 Apple Silicon Fix Recap

The installation of older computer music libraries fails on modern Macs because core dependencies like `PortMidi-0.2.0.0` hardcode Intel-specific CPU instructions (`-msse2`) and use older CoreMIDI data configurations.

```bash
git clone https://github.com/Euterpea/Euterpea2.git && cd Euterpea2
```

# 0. GHC and Cabal Setup

```bash
ghcup list | grep ✔✔
```
```lua
✔✔ cabal 3.14.2.0    recommended                                     
✔✔ ghc   9.12.4      base-4.21.2.0             2026-03-26            
✔✔ ghcup 0.2.6.2     latest,recommended                              
✔✔ hls   2.13.0.0    recommended                                     
✔✔ stack 2.15.5             
```

# ghc

## Complete workflow:

```bash
# 1. Update metadata
ghcup update

# 2. See all available GHC versions
ghcup list | grep ghc

# 3. See if 9.12 is available
ghcup list | grep "9.12"
```

```
# 4. Install the version you want (adjust to what's available)
ghcup install ghc 9.12.4
```
<details><summary>🪵 Log</summary>

  ```lua
ghcup install ghc 9.12.4
[ Info  ] downloading: https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.1.0.yaml as file /Users/valiha/.ghcup/cache/ghcup-0.1.0.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
[ Info  ] downloading: https://downloads.haskell.org/~ghc/9.12.4/ghc-9.12.4-aarch64-apple-darwin.tar.xz as file /Users/valiha/.ghcup/tmp/ghcup-ed54b997f4f084c7/ghc-9.12.4-aarch64-apple-darwin.tar.xz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  293M  100  293M    0     0   397k      0  0:12:37  0:12:37 --:--:--  462k
[ Info  ] verifying digest of: ghc-9.12.4-aarch64-apple-darwin.tar.xz
[ Info  ] Unpacking: ghc-9.12.4-aarch64-apple-darwin.tar.xz to /Users/valiha/.ghcup/tmp/ghcup-1d4240a6bc4b487b
[ Info  ] Installing ghc
[ make ] Installing ./hsc2hs -> /Users/valiha/.ghcup/tmp/ghcup-85d6045c46d249af//User...
[ make ] Installing ./runghc -> /Users/valiha/.ghcup/tmp/ghcup-85d6045c46d249af//User...
[ make ] Installing ./ghci-9.12.4 -> /Users/valiha/.ghcup/tmp/ghcup-85d6045c46d249af/...
[ make ] 
[ make ] Copying libraries to /Users/valiha/.ghcup/tmp/ghcup-85d6045c46d249af/Users/v...
[ make ] /usr/bin/install -c -m 755 -d "/Users/valiha/.ghcup/tmp/ghcup-85d6045c46d249...
46...
[ Info  ] Installing ghc
[ Info  ] ghc installation successful
```

</details>

```bash
# 5. Set as default
ghcup set ghc 9.12.4
```
<details><summary>🪵 Log</summary>

```lua
ghcup set ghc 9.12.4
[ Warn  ] GHC-9.12.4 appears to have no corresponding HLS-2.13.0.0 binary.
[ ...   ] Haskell IDE support may not work.
[ ...   ] You can try to either: 
[ ...   ]   1. Install a different HLS version (e.g. downgrade for older GHCs)
[ ...   ]   2. Install and set one of the following GHCs: [9.10.3, 9.12.2, 9.14.1, 9.6.7, 9.8.4]
[ ...   ]   3. Let GHCup compile HLS for you, e.g. run: ghcup compile hls -g 2.13.0.0 --ghc 9.12.4     (see https://www.haskell.org/ghcup/guide/#hls for more information)
[ Info  ] ghc 9.12.4 successfully set as default version

```

</details>

```bash
# 6. Verify
ghc --version
```
> The Glorious Glasgow Haskell Compilation System, version 9.12.4

## Alternative: Use `ghcup tui` (interactive mode)

If you want a nicer interface:

```bash
ghcup tui
```

This opens an interactive TUI where you can see all available versions, install, and set defaults with arrow keys.

## Common ghcup list filters:

```bash
# Show only installed versions
ghcup list | grep "✔" | grep ghc

# Show recommended versions
ghcup list | grep "recommended" | grep ghc

# Show latest versions
ghcup list | grep "latest" | grep ghc

# Show all GHC 9.x versions
ghcup list | grep "ghc-9\."
```

**Note**: Since GHC 9.12.4 might not be available yet, you may need to settle for 9.12.1 or 9.12.2 if they're in the list. Use `ghcup list | grep "9.12"` to see what's actually available.

***

## Install Cabal 3.14.2.0

```bash
ghcup install cabal 3.14.2.0
```
<details><summary>🪵 Log</summary>

```lua
[ Info  ] downloading: https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.1.0.yaml as file /Users/valiha/.ghcup/cache/ghcup-0.1.0.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
[ Info  ] downloading: https://downloads.haskell.org/~ghcup/unofficial-bindists/cabal/3.14.2.0/cabal-install-3.14.2.0-aarch64-apple-darwin.tar.xz as file /Users/valiha/.ghcup/tmp/ghcup-8a767dc2325b7fdd/cabal-install-3.14.2.0-aarch64-apple-darwin.tar.xz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 12.3M  100 12.3M    0     0   433k      0  0:00:29  0:00:29 --:--:--  458k
[ Info  ] verifying digest of: cabal-install-3.14.2.0-aarch64-apple-darwin.tar.xz
[ Info  ] Unpacking: cabal-install-3.14.2.0-aarch64-apple-darwin.tar.xz to /Users/valiha/.ghcup/tmp/ghcup-6a140a266f335360
[ Info  ] Installing cabal
[ Warn  ] GHC-9.12.4 appears to have no corresponding HLS-2.13.0.0 binary.
[ ...   ] Haskell IDE support may not work.
[ ...   ] You can try to either: 
[ ...   ]   1. Install a different HLS version (e.g. downgrade for older GHCs)
[ ...   ]   2. Install and set one of the following GHCs: [9.10.3, 9.12.2, 9.14.1, 9.6.7, 9.8.4]
[ ...   ]   3. Let GHCup compile HLS for you, e.g. run: ghcup compile hls -g 2.13.0.0 --ghc 9.12.4     (see https://www.haskell.org/ghcup/guide/#hls for more information)
[ Info  ] cabal installation successful
```

</details>


## Set it as default

```bash
ghcup set cabal 3.14.2.0
```
<details><summary>🪵 Log</summary>

```lua
[ Info  ] downloading: https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.1.0.yaml as file /Users/valiha/.ghcup/cache/ghcup-0.1.0.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:00:02 --:--:--     0
[ Warn  ] GHC-9.12.4 appears to have no corresponding HLS-2.13.0.0 binary.
[ ...   ] Haskell IDE support may not work.
[ ...   ] You can try to either: 
[ ...   ]   1. Install a different HLS version (e.g. downgrade for older GHCs)
[ ...   ]   2. Install and set one of the following GHCs: [9.10.3, 9.12.2, 9.14.1, 9.6.7, 9.8.4]
[ ...   ]   3. Let GHCup compile HLS for you, e.g. run: ghcup compile hls -g 2.13.0.0 --ghc 9.12.4     (see https://www.haskell.org/ghcup/guide/#hls for more information)
[ Info  ] cabal 3.14.2.0 successfully set as default version
```

</details>

## Verify

```bash
cabal --version
```

You should see something like:
```
cabal-install version 3.14.2.0
compiled using version 3.14.2.0 of the Cabal library
```

## Then update the package list

```bash
cabal update
```
<details><summary>🪵 Log</summary>

```lua

Configuration is affected by the following files:
- cabal.project
Downloading the latest package list from hackage.haskell.org
Package list of hackage.haskell.org has been updated.
The index-state is set to 2026-06-24T15:29:52Z.
To revert to previous state run:
    cabal v2-update 'hackage.haskell.org,2026-05-24T18:52:09Z'
```

</details>

## After that, try your install again

```bash
cabal install --lib --allow-newer
```

### Alternative: Install the latest version

If you want the absolute latest (3.16.1.0):

```bash
ghcup install cabal 3.16.1.0
ghcup set cabal 3.16.1.0
```

But **3.14.2.0** is recommended and should work perfectly with GHC 9.12.4.

### Why the older version failed

Cabal 3.10.3.0 (which came with GHC 9.6.x) doesn't understand how to handle GHC 9.12.4's newer package format, leading to the module re-export error. Cabal 3.14.2.0 and above are designed specifically to work with GHC 9.12 and later.


# `gcc` On Mac 🍎 Silicon, check `gcc` version is Mac's, i.e. not GNU

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
ghci> playDev 7 melody
ghci> :q
```

Enjoy coding your music!
