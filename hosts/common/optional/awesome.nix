{
	services.xserver = {
		enable = true;
		windowManager.awesome.enable = true;
		displayManager = {
			lightdm.enable = true;
			defaultSession = "none+awesome";
		};
		deviceSection = ''Option "TearFree" "true"''; # Disable screen tearing
	};
}
