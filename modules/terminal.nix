{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghostty fish
  ];

  programs.fish.enable = true;
}

