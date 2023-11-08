{ pkgs, inputs, ... }: {
	imports = [
		inputs.hardware.nixosModules.common-cpu-amd
		inputs.hardware.nixosModules.common-gpu-amd
		inputs.hardware.nixosModules.common-pc-ssd

		./hardware-configuration.nix

		../common/global
		../common/users/xun

		../common/optional/pipewire.nix
		../common/optional/quietboot.nix
	];

	networking = {
		hostname = "nixdesk";
		useDHCP = true;
	};

	boot = {
		kernelPackages = pkgs.linuxKernel.packages.linux_zen;
		binfmt.emulatedSystems = [ "aarch64-linux"  "i686-linux" ];
	};

	programs = {
		adb.enable = true;
		kdeconnect.enable = true;
	};

	system.stateVersion = "23.05";
}
