{ pkgs, ... }:

{
  home.packages = with pkgs; [
    heroic
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6"
  ];
}
