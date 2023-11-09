{
	boot = {
		initrd = {
			availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
		};
		kernelModules = [ "kvm-amd" ];
		loader.efi.efiSysMountPoint = "/boot";
	};

	fileSystems = {
		"/" = {
			device = "/dev/disk/by-uuid/0c080ce8-26f0-454b-a100-1ca9d5308931";
			fsType = "ext4";
		};
		"/boot" = {
			device = "/dev/disk/by-uuid/D23A-89BF";
			fsType = "vfat";
		};
	};

	swapDevices = [{
		device = "/var/lib/swapfile";
		randomEncryption.enable = true;
		size = 6 * 1024;
	}];

	nixpkgs.hostPlatform.system = "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = true;
}
