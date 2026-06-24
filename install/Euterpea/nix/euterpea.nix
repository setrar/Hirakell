# let's get nixpkgs into scope
with (import <nixpkgs> {});

let
  lib = haskell.lib;

  # build a "package set" (collection of packages) that has the correct versions of the dependencies
  # needed by Euterpea
  customHaskellPackages = haskellPackages.override (old: {
    overrides = self: super: {
        heap = self.callHackage "heap" "0.6.0" {}; 
        PortMidi = self.callHackage "PortMidi" "0.1.5.2" {};
        stm = self.callHackage "stm" "2.4.2" {};
    };
  });
in {
  # this is a ghc wrapper that has only Euterpea as its visible packages
  ghc = customHaskellPackages.ghcWithPackages (pkgs: [ pkgs.Euterpea ]);

  # this is just the output of the build for Euterpea 
  pkg = customHackagePackages.Euterpea;

  # for convenience, also expose the package set that we build against
  pkgset = customHaskellPackages;
}
