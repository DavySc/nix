{ config, pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/hardware/scan/not-detected.nix>
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.opengl.enable = true;
  hardware.bluetooth.enable = true;

  services.fstrim.enable = true;
}
