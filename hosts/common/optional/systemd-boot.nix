{
	boot.loader = {
		systemd-boot = {
			enable = true;
			consoleMode = "max";
			configurationLimit = 120;
		};
		efi.canTouchEfiVariables = true;
	};
}
