{ config, pkgs, ... }:
{
  home.username = "davy";
  home.homeDirectory = "/home/davy";
  home.stateVersion = "24.05";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx EDITOR nvim
      set -gx TERMINAL ghostty

      if not functions -q tide
        tide configure --auto --style=Classic \
          --prompt_colors='Catppuccin Mocha' \
          --show_time='No' \
          --classic_git='Yes' \
          --prompt_connection='Solid' \
          --prompt_spacing='Compact' \
          --icons='Few' \
          --transient='Prompt'
      end
    '';
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Cursors";
      package = pkgs.catppuccin-cursors.mocha;
    };
  };

  home.file.".config/hypr/hyprland.conf".text = ''
    monitor=,preferred,auto,1
    exec-once = ghostty
    exec-once = waybar
    exec-once = swww-daemon && swww img ~/.config/hypr/wallpaper.jpg

    $mod = SUPER
    bind = $mod, RETURN, exec, ghostty
    bind = $mod, Q, killactive,
    bind = $mod, E, exec, dolphin
    bind = $mod, D, exec, wofi --show run
    bind = $mod SHIFT, E, exec, hyprctl dispatch exit
    bind = $mod SHIFT, L, exec, swaylock
  '';

  home.file.".config/hypr/wallpaper.jpg".source = ./wallpapers/catppuccin-mocha.jpg;

  home.file.".config/waybar/style.css".text = ''
    * {
      font-family: JetBrainsMono Nerd Font, monospace;
      font-size: 13px;
      background: transparent;
      color: #cdd6f4;
    }
    window {
      background-color: #1e1e2e;
      border: 1px solid #585b70;
    }
    #clock, #battery, #network, #pulseaudio {
      padding: 0 10px;
    }
  '';

  home.file.".config/swaylock/config".text = ''
    font=JetBrainsMono Nerd Font
    show-failed-attempts
    indicator-idle-visible
    ignore-empty-password
    color=1e1e2e
    inside-color=1e1e2e
    ring-color=cba6f7
    line-color=cba6f7
    text-color=cdd6f4
  '';

  home.packages = with pkgs; [
    tide
    wofi
    swww
    waybar
    jetbrains-mono
  ];
}
