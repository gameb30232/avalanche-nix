# Avalanche Tools Channel

This Nix channel provides packages for working with Avalanche blockchain tools and utilities.

## Available Packages

- avalanche-cli: Official command line interface for Avalanche
- avalanchego: The official Avalanche node implementation
- subnet-evm: EVM package for creating Avalanche subnets

## Installation

Add the channel:

```bash
sudo nix-channel --add https://github.com/build9000ai/avalanche-nix/archive/master.tar.gz avalanche
sudo nix-channel --update
```

## Usage

Install packages:

```bash
nix-env -iA avalanche.avalanche-cli
nix-env -iA avalanche.avalanchego
```

NixOS configuration:

```nix
{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    avalanche = import <avalanche> { inherit pkgs; };
  };
}
```

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
