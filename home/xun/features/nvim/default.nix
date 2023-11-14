{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.neovim.packages.${pkgs.system}.neovim
  ];

  home.sessionVariables.EDITOR = "nvim";
}
