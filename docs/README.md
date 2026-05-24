# Haskell Installation


## :a: [`ghcup`](https://www.haskell.org/ghcup/)

## :one: Install Haskell

```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
<details><summary>🪵 Log</summary>
 
```powershell

Welcome to Haskell!

This script can download and install the following binaries:
  * ghcup - The Haskell toolchain installer
  * ghc   - The Glasgow Haskell Compiler
  * cabal - The Cabal build tool for managing Haskell software
  * stack - A cross-platform program for developing Haskell projects (similar to cabal)
  * hls   - (optional) A language server for developers to integrate with their editor/IDE

ghcup installs only into the following directory,
which can be removed anytime:
  /Users/valiha/.ghcup

Press ENTER to proceed or ctrl-c to abort.
Note that this script can be re-run at any given time.

-------------------------------------------------------------------------------

Detected zsh shell on your system...
Do you want ghcup to automatically add the required PATH variable to "/Users/valiha/.zshrc"?

[P] Yes, prepend  [A] Yes, append  [N] No  [?] Help (default is "P").


-------------------------------------------------------------------------------
Do you want to install haskell-language-server (HLS)?
HLS is a language-server that provides IDE-like functionality
and can integrate with different editors, such as Vim, Emacs, VS Code, Atom, ...
Also see https://haskell-language-server.readthedocs.io/en/stable/

[Y] Yes  [N] No  [?] Help (default is "N").


-------------------------------------------------------------------------------
Do you want to enable better integration of stack with GHCup?
This means that stack won't install its own GHC versions, but uses GHCup's.
For more information see:
  https://docs.haskellstack.org/en/stable/yaml_configuration/#ghc-installation-customisation-experimental
If you want to keep stacks vanilla behavior, answer 'No'.

[Y] Yes  [N] No  [?] Help (default is "Y").


  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  105M  100  105M    0     0  50.4M      0  0:00:02  0:00:02 --:--:-- 50.5M
[ Info  ] downloading: https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.0.8.yaml as file /Users/valiha/.ghcup/cache/ghcup-0.0.8.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  404k  100  404k    0     0  1639k      0 --:--:-- --:--:-- --:--:-- 1644k
[ Info  ] Upgrading GHCup...
[ Warn  ] No GHCup update available

System requirements 
  Note: On OS X, in the course of running ghcup you will be given a dialog box to install the command line tools. Accept and the requirements will be installed for you. You will then need to run the command again.
On Darwin M1 you might also need a working llvm installed (e.g. via brew) and have the toolchain exposed in PATH.
Press ENTER to proceed or ctrl-c to abort.
Installation may take a while.


[ Info  ] downloading: https://downloads.haskell.org/~ghc/9.4.8/ghc-9.4.8-aarch64-apple-darwin.tar.xz as file /Users/valiha/.ghcup/cache/ghc-9.4.8-aarch64-apple-darwin.tar.xz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  187M  100  187M    0     0  56.6M      0  0:00:03  0:00:03 --:--:-- 56.6M
[ Info  ] verifying digest of: ghc-9.4.8-aarch64-apple-darwin.tar.xz
[ Info  ] Unpacking: ghc-9.4.8-aarch64-apple-darwin.tar.xz to /Users/valiha/.ghcup/tmp/ghcup-b1571e2414900299
[ Info  ] Installing GHC (this may take a while)
[ Info  ] Merging file tree from "/Users/valiha/.ghcup/tmp/ghcup-02618577ffd80c67/Users/valiha/.ghcup/ghc/9.4.8" to "/Users/valiha/.ghcup/ghc/9.4.8"
[ Info  ] GHC installation successful
[ Info  ] GHC 9.4.8 successfully set as default version
[ Info  ] downloading: https://downloads.haskell.org/ghcup/unofficial-bindists/cabal/3.10.3.0/cabal-install-3.10.3.0-aarch64-apple-darwin.tar.xz as file /Users/valiha/.ghcup/cache/cabal-install-3.10.3.0-aarch64-apple-darwin.tar.xz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11.3M  100 11.3M    0     0  32.8M      0 --:--:-- --:--:-- --:--:-- 32.8M
[ Info  ] verifying digest of: cabal-install-3.10.3.0-aarch64-apple-darwin.tar.xz
[ Info  ] Unpacking: cabal-install-3.10.3.0-aarch64-apple-darwin.tar.xz to /Users/valiha/.ghcup/tmp/ghcup-87a65bdcc1e179e1
[ Info  ] Installing cabal
[ Info  ] Cabal installation successful
Config file path source is default config file.
Config file not found: /Users/valiha/.cabal/config
Writing default configuration to /Users/valiha/.cabal/config
Downloading the latest package list from hackage.haskell.org
Package list of hackage.haskell.org has been updated.
The index-state is set to 2024-04-20T10:21:37Z.
[ Info  ] downloading: https://downloads.haskell.org/~ghcup/unofficial-bindists/stack/2.15.5/stack-2.15.5-osx-aarch64.tar.gz as file /Users/valiha/.ghcup/cache/stack-2.15.5-osx-aarch64.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 20.6M  100 20.6M    0     0  43.7M      0 --:--:-- --:--:-- --:--:-- 43.7M
[ Info  ] verifying digest of: stack-2.15.5-osx-aarch64.tar.gz
[ Info  ] Unpacking: stack-2.15.5-osx-aarch64.tar.gz to /Users/valiha/.ghcup/tmp/ghcup-8aa07eae31629bcc
[ Info  ] Installing stack
[ Info  ] Stack installation successful
[ Info  ] Stack manages GHC versions internally by default. To improve integration, please visit:
[ ...   ]   https://www.haskell.org/ghcup/guide/#stack-integration
[ ...   ] 
[ ...   ] Also check out:
[ ...   ]   https://docs.haskellstack.org/en/stable/yaml_configuration
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   764  100   764    0     0   1711      0 --:--:-- --:--:-- --:--:--  1713

===============================================================================

OK! /Users/valiha/.zshrc has been modified. Restart your terminal for the changes to take effect,
or type ". /Users/valiha/.ghcup/env" to apply them in your current terminal session.

===============================================================================

All done!

To start a simple repl, run:
  ghci

To start a new haskell project in the current directory, run:
  cabal init --interactive

To install other GHC versions and tools, run:
  ghcup tui

If you are new to Haskell, check out https://www.haskell.org/ghcup/steps/
```

</details>

### :two: set Env Variable (~/.bashrc or ~/.zshrc)

```
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
```

## :three: `gcup` usage

* List all installed binaries

```
ghcup list
```
<details><summary>🪵 Log</summary>

```lua
[ Info  ] downloading: https://raw.githubusercontent.com/haskell/ghcup-metadata/master/ghcup-0.1.0.yaml as file /Users/valiha/.ghcup/cache/ghcup-0.1.0.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
   Tool  Version     Tags                      Notes     
✗  cabal 2.4.1.0                               no-bindist
✗  cabal 3.0.0.0                               no-bindist
✗  cabal 3.2.0.0                               no-bindist
✗  cabal 3.4.0.0                                         
✗  cabal 3.4.1.0                                         
✗  cabal 3.6.0.0                                         
✗  cabal 3.6.2.0                                         
✗  cabal 3.6.2.0-p1                                      
✗  cabal 3.8.1.0                                         
✗  cabal 3.10.1.0                                        
✗  cabal 3.10.2.0                                        
✗  cabal 3.10.2.1                                        
✔✔ cabal 3.10.3.0                                        
✗  cabal 3.12.1.0                                        
✗  cabal 3.14.1.0                                        
✗  cabal 3.14.1.1                                        
✗  cabal 3.14.1.1-p1                                     
✗  cabal 3.14.2.0    recommended                         
✗  cabal 3.16.0.0                                        
✗  cabal 3.16.1.0    latest                              
✗  ghc   7.10.3      base-4.8.2.0              no-bindist
✗  ghc   8.0.2       base-4.9.1.0              no-bindist
✗  ghc   8.2.2       base-4.10.1.0             no-bindist
✗  ghc   8.4.1       base-4.11.0.0             no-bindist
✗  ghc   8.4.2       base-4.11.1.0             no-bindist
✗  ghc   8.4.3       base-4.11.1.0             no-bindist
✗  ghc   8.4.4       base-4.11.1.0             no-bindist
✗  ghc   8.6.1       base-4.12.0.0             no-bindist
✗  ghc   8.6.2       base-4.12.0.0             no-bindist
✗  ghc   8.6.3       base-4.12.0.0             no-bindist
✗  ghc   8.6.4       base-4.12.0.0             no-bindist
✗  ghc   8.6.5       base-4.12.0.0             no-bindist
✗  ghc   8.8.1       base-4.13.0.0             no-bindist
✗  ghc   8.8.2       base-4.13.0.0             no-bindist
✗  ghc   8.8.3       base-4.13.0.0             no-bindist
✗  ghc   8.8.4       base-4.13.0.0             no-bindist
✗  ghc   8.10.1      base-4.14.0.0             no-bindist
✗  ghc   8.10.2      base-4.14.1.0             no-bindist
✗  ghc   8.10.3      base-4.14.1.0             no-bindist
✗  ghc   8.10.4      base-4.14.1.0             no-bindist
✗  ghc   8.10.5      base-4.14.2.0                       
✗  ghc   8.10.6      base-4.14.3.0                       
✗  ghc   8.10.7      base-4.14.3.0                       
✗  ghc   9.0.1       base-4.15.0.0             no-bindist
✗  ghc   9.0.2       base-4.15.1.0                       
✗  ghc   9.2.1       base-4.16.0.0                       
✗  ghc   9.2.2       base-4.16.1.0                       
✗  ghc   9.2.3       base-4.16.2.0                       
✗  ghc   9.2.4       base-4.16.3.0                       
✗  ghc   9.2.5       base-4.16.4.0                       
✗  ghc   9.2.6       base-4.16.4.0                       
✗  ghc   9.2.7       base-4.16.4.0                       
✗  ghc   9.2.8       base-4.16.4.0                       
✗  ghc   9.4.1       base-4.17.0.0                       
✗  ghc   9.4.2       base-4.17.0.0                       
✗  ghc   9.4.3       base-4.17.0.0                       
✗  ghc   9.4.4       base-4.17.0.0                       
✗  ghc   9.4.5       base-4.17.1.0                       
✗  ghc   9.4.6       base-4.17.2.0                       
✗  ghc   9.4.7       base-4.17.2.0                       
✔✔ ghc   9.4.8       base-4.17.2.1                       
✗  ghc   9.6.1       base-4.18.0.0                       
✗  ghc   9.6.2       base-4.18.0.0                       
✗  ghc   9.6.3       base-4.18.1.0                       
✗  ghc   9.6.4       base-4.18.2.0                       
✗  ghc   9.6.5       base-4.18.2.1                       
✗  ghc   9.6.6       base-4.18.2.1                       
✗  ghc   9.6.7       recommended,base-4.18.3.0           
✗  ghc   9.8.1       base-4.19.0.0             2023-10-09
✗  ghc   9.8.2       base-4.19.1.0             2024-02-23
✗  ghc   9.8.4       base-4.19.2.0             2024-11-27
✗  ghc   9.10.1      base-4.20.0.0                       
✗  ghc   9.10.2      base-4.20.1.0                       
✗  ghc   9.10.3      base-4.20.1.0                       
✗  ghc   9.12.1      base-4.21.0.0             2024-12-15
✗  ghc   9.12.2      base-4.21.0.0             2025-03-12
✗  ghc   9.12.4      base-4.21.2.0             2026-03-26
✗  ghc   9.14.1      latest,base-4.22.0.0      2025-12-18
✔✔ ghcup 0.2.3.0     latest,recommended                  
✗  hls   1.1.0                                 no-bindist
✗  hls   1.2.0                                 no-bindist
✗  hls   1.3.0                                 no-bindist
✗  hls   1.4.0                                           
✗  hls   1.5.0                                           
✗  hls   1.5.1                                           
✗  hls   1.6.0.0                                         
✗  hls   1.6.1.0                                         
✗  hls   1.7.0.0                                         
✗  hls   1.8.0.0                                         
✗  hls   1.9.0.0                                         
✗  hls   1.9.1.0                                         
✗  hls   1.10.0.0                                        
✗  hls   2.0.0.0                                         
✗  hls   2.0.0.1                                         
✗  hls   2.1.0.0                                         
✗  hls   2.2.0.0                                         
✗  hls   2.3.0.0                                         
✗  hls   2.4.0.0                                         
✗  hls   2.5.0.0                                         
✗  hls   2.6.0.0                                         
✗  hls   2.7.0.0                                         
✗  hls   2.8.0.0                                         
✗  hls   2.9.0.0                                         
✗  hls   2.9.0.1                                         
✗  hls   2.10.0.0                                        
✗  hls   2.11.0.0                                        
✗  hls   2.12.0.0                                        
✗  hls   2.13.0.0    recommended                         
✗  hls   2.14.0.0    latest                              
✗  stack 2.5.1                                 no-bindist
✗  stack 2.7.1                                 no-bindist
✗  stack 2.7.3                                 2022-02-02
✗  stack 2.7.5                                           
✗  stack 2.9.1                                           
✗  stack 2.9.3                                           
✗  stack 2.11.1                                          
✗  stack 2.13.1                                          
✗  stack 2.15.1                                          
✗  stack 2.15.3                                          
✔✔ stack 2.15.5                                          
✗  stack 2.15.7                                          
✗  stack 3.1.1                                           
✗  stack 3.3.1                                           
✗  stack 3.5.1                                           
✗  stack 3.7.1       recommended                         
✗  stack 3.9.1                                           
✗  stack 3.9.3       latest                              
```

</details>

* Install a specific version (Mac: `8.2.2 – 9.4.6` is recommended to use `Euterpea` ) but we'll use `9.4.8` 

```
ghcup install ghc 9.4.8 
```

* Set a specific version

```
ghcup set ghc 9.4.8 
```

## :b: Euterpea Module Library

* Update `cabal`'s libraries

```
cabal update
```
<details><summary>🪵 Log</summary>

```lua
Downloading the latest package list from hackage.haskell.org
Package list of hackage.haskell.org is up to date.
The index-state is set to 2026-05-24T18:52:09Z.
```

</details>

* Install the `Euterpea` module

```
cabal install Euterpea
```
<details><summary>🪓 Log</summary>

```lua
Downloading the latest package list from hackage.haskell.org
Package list of hackage.haskell.org is up to date.
The index-state is set to 2026-05-24T18:52:09Z.
valiha@Mac Hirakell % cd ..
valiha@Mac Developer % cd -
~/Developer/Hirakell
valiha@Mac Hirakell % cabal install Euterpea
Error: cabal: Could not resolve dependencies:
[__0] trying: Hirakell-0.1.0.0 (user goal)
[__1] next goal: base (dependency of Hirakell)
[__1] rejecting: base-4.17.2.1/installed-4.17.2.1 (conflict: Hirakell =>
base>=4.12 && <4.13)
[__1] skipping: base-4.22.0.0, base-4.21.2.0, base-4.21.1.0, base-4.21.0.0,
base-4.20.2.0, base-4.20.1.0, base-4.20.0.1, base-4.20.0.0, base-4.19.2.0,
base-4.19.1.0, base-4.19.0.0, base-4.18.3.0, base-4.18.2.1, base-4.18.2.0,
base-4.18.1.0, base-4.18.0.0, base-4.17.2.1, base-4.17.2.0, base-4.17.1.0,
base-4.17.0.0, base-4.16.4.0, base-4.16.3.0, base-4.16.2.0, base-4.16.1.0,
base-4.16.0.0, base-4.15.1.0, base-4.15.0.0, base-4.14.3.0, base-4.14.2.0,
base-4.14.1.0, base-4.14.0.0, base-4.13.0.0 (has the same characteristics that
caused the previous version to fail: excluded by constraint '>=4.12 && <4.13'
from 'Hirakell')
[__1] rejecting: base-4.12.0.0, base-4.11.1.0, base-4.11.0.0, base-4.10.1.0,
base-4.10.0.0, base-4.9.1.0, base-4.9.0.0, base-4.8.2.0, base-4.8.1.0,
base-4.8.0.0, base-4.7.0.2, base-4.7.0.1, base-4.7.0.0, base-4.6.0.1,
base-4.6.0.0, base-4.5.1.0, base-4.5.0.0, base-4.4.1.0, base-4.4.0.0,
base-4.3.1.0, base-4.3.0.0, base-4.2.0.2, base-4.2.0.1, base-4.2.0.0,
base-4.1.0.0, base-4.0.0.0, base-3.0.3.2, base-3.0.3.1 (constraint from
non-upgradeable package requires installed instance)
[__1] fail (backjumping, conflict set: Hirakell, base)
After searching the rest of the dependency tree exhaustively, these were the
goals I've had most trouble fulfilling: base, Hirakell
```

</details>

* If using `cabal` 3.x version

```
cabal v1-install Euterpea
```

## :ab: HSoM Module Library (Optional)

* Update `cabal`'s libraries

```
cabal update
```

* Install the `HSoM` module (Haskell School of Music)

```
cabal install HSoM
```

* If using `cabal` 3.x version

```
cabal v1-install HSoM
```

## :o: MIDI Player

As stated by the `Euterpea` website, I can use [`SimpleSynth`](http://notahat.com/simplesynth) on my Mac.

Since I run MacOS Catalina I had to recompile `SimpleSynth` https://github.com/setrar/simplesynth to upgrade the version

<img src="../images/SimpleSynth.png" width="617" height="573"> </img>
