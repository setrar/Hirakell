Here's a cheat sheet for using Haskell libraries, covering installation, management, and common workflows.

### 📦 Installation & Management

| Task | Command |
| :--- | :--- |
| **Update package list** | `cabal update` |
| **Install a library globally** | `cabal install <library-name> --lib` |
| **Install with relaxed constraints** | `cabal install <library-name> --lib --allow-newer` |
| **Install to a local project env** | `cabal install <library-name> --lib --package-env=.` |
| **Force reinstall (overwrite)** | `cabal install <library-name> --lib --force-reinstalls` |
| **Install using v1-style (legacy)** | `cabal v1-install <library-name>` |
| **List globally installed packages** | `ghc-pkg list` |
| **List user/local env packages** | `ghc-pkg list --user` |
| **Search for a package on Hackage** | `cabal info <library-name>` |
| **See a package's dependencies** | `cabal info <library-name> --dependencies` |

### 📂 Project Setup with `.cabal` File

1.  **Create a project**:
    ```bash
    cabal init
    ```

2.  **Add dependencies** to the `.cabal` file:
    ```haskell
    library
        build-depends: base ^>=4.21,
                       <library-name> >= 1.0,
                       another-library
    ```

3.  **Build the project**:
    ```bash
    cabal build
    ```

4.  **Open a REPL with project context**:
    ```bash
    cabal repl
    ```

### 🧪 Using Libraries in GHCi

| Task | Command |
| :--- | :--- |
| **Start GHCi** | `ghci` |
| **Load a package in GHCi** | `ghci -package <library-name>` |
| **Import a module** | `import Module.Name` |
| **Import with alias** | `import qualified Module.Name as M` |
| **Import specific functions** | `import Module.Name (function1, function2)` |
| **See loaded packages** | `:show packages` |
| **Reload current file** | `:reload` or `:r` |

### 🔍 Troubleshooting

| Problem | Check/Solution |
| :--- | :--- |
| **`Could not find module`** | 1. Is the library installed? `ghc-pkg list <library>`<br>2. Is it in your `.cabal` file's `build-depends`?<br>3. Did you run `cabal build` or `cabal repl` recently? |
| **`hidden package` error** | The package is installed but not exposed to your project. Add it to `build-depends` in the `.cabal` file. |
| **`no-bindist` or installation fails** | The library may not have a pre-built binary for your OS. You can try: `cabal install --lib --allow-newer` to relax constraints. |
| **GHCi doesn't see a globally installed package** | Check if it's installed to the **user** environment (`ghc-pkg list --user`). Use `--global` flag when installing if you want it in the system database. |
| **Version conflicts** | Use `--allow-newer` to relax upper bounds, or use `cabal v1-install` for legacy solver. Often, a `cabal update` first can help. |

### 💡 Quick Tips

*   **Global vs. Local**: Installing with `--lib` usually puts packages in a **user environment** (`~/.ghc/`), not the global system database. This is a good default as it avoids permission issues.
*   **Project Isolation**: For serious work, always define dependencies in your `.cabal` file and use `cabal build`/`cabal repl`. This ensures your project is reproducible and isolated.
*   **Finding Modules**: The module name to import is often not the same as the package name. Check the library's documentation on Hackage to find the correct module name.
