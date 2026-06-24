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
