{
  pkgs,
  config,
  lib,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  # TODO add default passwords and stuff

  users.mutableUsers = false;
  users.users.xun = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups =
      [
        "wheel"
        "video"
        "audio"
      ]
      ++ ifTheyExist [
        "network"
        "git"
        "libvirtd"
      ];

    hashedPasswordFile = config.sops.secrets.xun-password.path;
    packages = [pkgs.home-manager];
  };

  sops.secrets.xun-password = {
    sopsFile = ../../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.xun = import ../../../../home/xun/${config.networking.hostName}.nix;
}
