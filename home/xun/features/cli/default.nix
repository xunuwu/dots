{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    bat
    gh
    gitui
    tmux
    fzf
    htop
    btop
    nvtop
    ripgrep
  ];
}
