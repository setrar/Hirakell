
```bash
ghci -package HSoM -package UISF -package Euterpea -package arrows -package pure-fft -package containers -threaded
```
```lua
Loaded package environment from /Users/valiha/.ghc/aarch64-darwin-9.12.4/environments/default
GHCi, version 9.12.4: https://www.haskell.org/ghc/  :? for help
ghci> import Control.Concurrent
ghci> runInBoundThread main
<interactive>:2:18: error: [GHC-88464]
    Variable not in scope: main :: IO a
    Suggested fix: Perhaps use ‘min’ (imported from Prelude)

ghci> import GHC.Conc
ghci> mainThreadId <- myThreadId
ghci> runInBoundThread main
<interactive>:5:18: error: [GHC-88464]
    Variable not in scope: main :: IO a
    Suggested fix: Perhaps use ‘min’ (imported from Prelude)

ghci> :q
```



<image src=images/DrumMUI.png width=50% height=50% > </image>

The GLUT error is a macOS-specific issue where GUI operations (like opening a window) need to run on the main thread. This is common when running GUI applications from GHCi on macOS.

## Solution 1: Use the Compiled Executable (Recommended)

Since you've already successfully loaded the file, compile it and run the executable:

```bash
# Compile with optimizations
ghc -O2 -package HSoM -package UISF -package Euterpea -package arrows -package pure-fft -package containers DrumMUI.lhs -o drum-mui

# Run the compiled executable
./drum-mui
```

The compiled version handles the main thread correctly.

