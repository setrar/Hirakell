# Haskell


## :a: Proper Install

## :one: Install Haskell using [`ghcup`](https://www.haskell.org/ghcup/)

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
$ ghcup install 8.6.3
```

* Set a specific version

```
$ ghcup set 8.6.3
```
