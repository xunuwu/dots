{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ./services

    ../common/global
    ../common/users/xun

    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/awesome.nix
    ../common/optional/qmk.nix
    ../common/optional/steam.nix
    ../common/optional/tailscale.nix
    ../common/optional/syncthing.nix
    ../common/optional/virtualization.nix
  ];

  services.xserver.displayManager.autoLogin.user = "xun";

  networking = {
    hostName = "nixdesk";
    useDHCP = true;
  };

  networking.firewall = {
    # Goldberg steam emulator
    allowedTCPPorts = [47584];
    allowedUDPPorts = [47584];
  };

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    binfmt.emulatedSystems = ["aarch64-linux" "i686-linux"];
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  system.stateVersion = "23.11";
}
