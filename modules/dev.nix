{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    haskell.compiler.ghc96
    clash-ghc
    ghdl
    htop
  ];
}
