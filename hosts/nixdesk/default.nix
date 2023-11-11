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
		../common/optional/systemd-boot.nix
		../common/optional/awesome.nix
		../common/optional/qmk.nix
	];

	services.xserver.displayManager.autoLogin.user = "xun";

	networking = {
		hostName = "nixdesk";
		useDHCP = true;
	};

	boot = {
		kernelPackages = pkgs.linuxKernel.packages.linux_zen;
		binfmt.emulatedSystems = [ "aarch64-linux"  "i686-linux" ];
	};

	programs = {
		adb.enable = true;
		dconf.enable = true;
	};

	system.stateVersion = "23.11";
}
