

# nix

```bash
nix-build euterpea.nix -A ghc # build a GHC with the Euterpea package included
```

That is a **Nix expression** (specifically a configuration file, usually saved as `euterpea.nix`) used by the **Nix package manager** to build a completely isolated, reproducible development environment for Euterpea.

Think of it as an alternative to the manual Cabal installation you just did, but completely automated and sandboxed.

Here is exactly what this script is doing, line by line:

### 1. Pinning the Broken Dependencies

Remember how you had to manually hack `PortMidi` and edit files because the newer versions didn't match Euterpea’s expectations? This section handles that automatically:

```nix
customHaskellPackages = haskellPackages.override (old: {
  overrides = self: super: {
      heap = self.callHackage "heap" "0.6.0" {}; 
      PortMidi = self.callHackage "PortMidi" "0.1.5.2" {};
      stm = self.callHackage "stm" "2.4.2" {};
  };
});

```

Instead of fighting with Cabal's dependency solver, this tells Nix: *"Go to Hackage, download these specific, exact older versions of `heap`, `PortMidi`, and `stm`, and use them to build the ecosystem."*

### 2. Creating a Custom Compiler (The "Magic" Part)

This line is what the comment refers to:

```nix
ghc = customHaskellPackages.ghcWithPackages (pkgs: [ pkgs.Euterpea ]);

```

This tells Nix to build a custom version of `ghci` and `ghc` that has `Euterpea` **pre-installed and baked directly into it**.

If you use this Nix script, you don't run `cabal install --lib`. You just run the command at the top of your snippet: `nix-build euterpea.nix -A ghc`. Nix will download GHC, pull the correct C libraries for your Mac, build PortMidi, build Euterpea, and drop you into a shell where typing `import Euterpea` works flawlessly out of the box.

### Why do people use this?

Because of the exact headache you just went through! A year from now, if you upgrade your Mac's macOS or GHC version, your manual Cabal setup might break again. A Nix script ensures that whether you run it today, on a different computer, or 5 years from now, it will build the exact same working environment every single time.
