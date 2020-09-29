# Haskell Installation


## :a: [`ghcup`](https://www.haskell.org/ghcup/)

## :one: Install Haskell

```
$ curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
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

* Install a specific version (ghc 8.6.3 is recommanded to use Euterpea )

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
