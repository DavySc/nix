{ config, pkgs, ... }:
{
  imports = [ ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "legion7";
  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  users.users.davy = {
    isNormalUser = true;
    description = "Davy";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.fish;
  };

  system.stateVersion = "24.05";
}


