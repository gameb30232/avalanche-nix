{ pkgs ? import <nixpkgs> {} }:

{
  avalanche-cli = pkgs.callPackage ./pkgs/avalanche-cli {};
  avalanchego = pkgs.callPackage ./pkgs/avalanchego {};
}
