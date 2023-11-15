{pkgs, ...}: {
  imports = [
    ./direnv.nix
    ./zsh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    bat
    lf
    gh
    gitui
    fzf
    htop
    btop
    ripgrep
  ];
}
