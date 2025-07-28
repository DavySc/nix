{ pkgs, ... }:
{
  home-manager.users.davy.programs.git.enable = true;
  home-manager.users.davy.home.file.".config/nvim".source = pkgs.fetchFromGitHub {
    owner = "DavySc";
    repo = "my-nvim";
    rev = "main";
    sha256 = "0000000000000000000000000000000000000000000000000000"; # Replace
  };
}

