{ pkgs, ... }:
{
  imports = [
    ./direnv.nix
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
    ripgrep
  ];
}
