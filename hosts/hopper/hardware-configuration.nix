{
  boot = {
    initrd.availableKernelModules = [ "ehci_pci" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    kernelModules = [ "kvm-intel" ];
    loader.timeout = 5;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/1297e638-f2ff-49a2-a362-314ac7eeaabc";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };
    "home" = {
      device = "/dev/disk/by-uuid/1297e638-f2ff-49a2-a362-314ac7eeaabc";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };
    "nix" = {
      device = "/dev/disk/by-uuid/1297e638-f2ff-49a2-a362-314ac7eeaabc";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8D4C-2F05";
    fsType = "vfat";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform.system = "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true;
}
