{
  config,
  pkgs,
  lib,
  ...
}: let
  vencord = pkgs.discord.override {
    withVencord = true;
  };
in {
  home.packages = [
    pkgs.discord-rpc
    vencord
  ];
}
