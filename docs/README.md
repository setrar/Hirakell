# Haskell Installation


## :a: [`ghcup`](https://www.haskell.org/ghcup/)

## :one: Install Haskell

```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
> Returns
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

```

### :two: set Env Variable (~/.bashrc or ~/.zshrc)

```
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
```

## :three: `gcup` usage

* List all installed binaries

```
$ ghcup list
```

* Install a specific version (ghc 8.6.3 is recommended to use `Euterpea` )

```
$ ghcup install ghc 8.6.3
```

* Set a specific version

```
$ ghcup set ghc 8.6.3
```

## :b: Euterpea Module Library

* Update `cabal`'s libraries

```
$ cabal update
```

* Install the `Euterpea` module

```
$ cabal install Euterpea
```

* If using `cabal` 3.x version

```
$ cabal v1-install Euterpea
```

## :ab: HSoM Module Library (Optional)

* Update `cabal`'s libraries

```
$ cabal update
```

* Install the `HSoM` module (Haskell School of Music)

```
$ cabal install HSoM
```

* If using `cabal` 3.x version

```
$ cabal v1-install HSoM
```

## :o: MIDI Player

As stated by the `Euterpea` website, I can use [`SimpleSynth`](http://notahat.com/simplesynth) on my Mac.

Since I run MacOS Catalina I had to recompile `SimpleSynth` https://github.com/setrar/simplesynth to upgrade the version

<img src="../images/SimpleSynth.png" width="617" height="573"> </img>
