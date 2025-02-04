let
  pkgs = import <nixpkgs> {};
in {
  inherit pkgs;
  avalanche-cli = pkgs.callPackage ./pkgs/avalanche-cli {};
  avalanchego = pkgs.callPackage ./pkgs/avalanchego {};
  subnet-evm = pkgs.callPackage ./pkgs/subnet-evm {};
}
