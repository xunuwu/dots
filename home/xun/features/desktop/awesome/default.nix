{ lib, config, pkgs, ... }: {
  imports = [
    ../common
    ../common/x11
  ];
  xdg.configFile."awesome/" = {
    source = ./config;
    recursive = true;
  };
}
