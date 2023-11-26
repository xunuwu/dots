{inputs, ...}: {
  imports = [
    ./global
    ./features/cli
    ./features/nvim
    ./features/desktop/awesome
  ];
  colorscheme = inputs.nix-colors.colorschemes.darkviolet;
  programs.neovim.defaultEditor = true;
}
