# ghc

```bash
# List all tools and filter with grep
ghcup list | grep ghc

# Or more specifically for GHC
ghcup list | grep "^ghc"

# To see available versions of GHC with their status
ghcup list | grep "ghc" | head -20
```

## To see if GHC 9.12.x is available:

```bash
ghcup list | grep "9.12"
```

## To install a specific version:

```bash
# Install the version you see in the list
ghcup install ghc 9.12.1

# Or install the latest available
ghcup install ghc latest
```

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
ghcup install ghc 9.12.1
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
```

</details>

```
# 5. Set as default
ghcup set ghc 9.12.1

# 6. Verify
ghc --version
```

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
