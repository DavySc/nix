## 🧠 Top-Level NixOS Flake Setup with Fish, Hyprland, Ghostty, and Catppuccin ##
{
  description = "NixOS config for Legion 7 with Hyprland + Fish + Catppuccin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, flake-utils, hyprland, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      in
      {
        packages.default = pkgs.hello;
      }) // {
        nixosConfigurations.legion7 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/legion7.nix
            ./modules/hardware.nix
            ./modules/desktop.nix
            ./modules/terminal.nix
            ./modules/dev.nix
            ./modules/nvim.nix
            home-manager.nixosModules.home-manager
            hyprland.nixosModules.default
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.davy = import ./home/default.nix;
            }
          ];
        };
      };
}


