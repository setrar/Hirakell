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

# 4. Install the version you want (adjust to what's available)
ghcup install ghc 9.12.1

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
