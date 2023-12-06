# https://github.com/NixOS/nixpkgs/pull/270646
{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  services.slskd = {
    settings = {
      soulseek.username = "xuntan";
    };
  };
  #sops.secrets.my-secret = {
  #  name = "hi";
  #};
}
