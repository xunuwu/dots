{inputs, ...}: {
  imports = [
    ./global
    ./features/cli
    ./features/nvim
    ./features/desktop/awesome
  ];
  programs.neovim.defaultEditor = true;
}
