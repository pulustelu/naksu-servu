{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    oliviabot.url = "github:RocketRace/oliviabot";
    oliviabot.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixos-hardware,
    ...
  }:
  {
    nixosConfigurations."caique" = nixpkgs.lib.nixosSystem {
      system = "x86_84-linux";
      modules = [
        nixos-hardware.nixosModules.apple-macbook-pro-11-1
        ./configuration.nix
        ./region.nix
        (import ./services.nix {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          inherit inputs;
        })
      ];
    };
  };
}