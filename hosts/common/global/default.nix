{ inputs, outputs, ... }: {
	imports = [
		inputs.home-manager.nixosModules.home-manager
		./fish.nix
		./locale.nix
		./nix.nix
		#./openssh.nix
		./steam-hardware.nix
		./systemd-initrd.nix
		#./tailscale.nix
		./zsh.nix
	] ++ (builtins.attrValues outputs.nixosModules);

	home-manager.extraSpecialArgs = { inherit inputs outputs; };

	nixpkgs = {
		overlays = builtins.attrValues outputs.overlays;
		config = {
			allowUnfree = true;
		};
	};

	hardware.enableRedistributableFirmware = true;

	# increase open file limit for wheel
	security.pam.loginLimits = [
		{
			domain = "@wheel";
			item = "nofile";
			type = "soft";
			value = "524288";
		}
		{
			domain = "@wheel";
			item = "nofile";
			type = "hard";
			value = "1048576";
		}
	];
}
