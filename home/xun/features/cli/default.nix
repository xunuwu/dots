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
    killall
    fzf
    htop
    btop
    ripgrep
  ];
}
