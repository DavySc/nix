{ config, pkgs, ... }:
{
  services.displayManager.sddm.enable = false;
  services.xserver.enable = true;

  services.dbus.enable = true;

  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };
}
