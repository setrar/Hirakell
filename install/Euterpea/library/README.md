# Library

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

* Install the `Euterpea` module :x: This isn't working you need to install manually

```
cabal install Euterpea
```
<details><summary>🪓 Log</summary>

```lua
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

<img src="../../../images/SimpleSynth.png" width="617" height="573"> </img>
