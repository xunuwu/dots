{
  inputs,
  pkgs,
  ...
}: let
  language_servers = with pkgs; [
    #lua-language-server
    #rust-analyzer
    #nil
    #clang-tools
  ];
in {
  nixpkgs.overlays = [inputs.emacs-overlay.overlay];
  home.packages = with pkgs;
    [
      emacs-all-the-icons-fonts
      (emacsWithPackagesFromUsePackage {
        config = ./emacs.el;
        defaultInitFile = true;
        package = pkgs.emacs-unstable;

        alwaysEnsure = true;
        extraEmacsPackages = epkgs: [
          epkgs.use-package
        ];
      })
    ]
    ++ language_servers;
}
