{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-hdd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/xun

    ../common/optional/systemd-boot.nix
    ../common/optional/steam.nix
    ../common/optional/awesome.nix
    ../common/optional/tailscale.nix
    ../common/optional/syncthing.nix
  ];

  networking = {
    hostName = "hopper";
    useDHCP = true;
  };

  programs.dconf.enable = true;

  system.stateVersion = "23.11";
}
