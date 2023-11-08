{ inputs, outputs, ... }: {
	imports = [
		./global
		./features/desktop/awesome
		./features/nvim
		./features/cli
	];

	colorscheme = inputs.nix-colors.colorschemes.tokyo-night-terminal-dark;
	
	# |DP-3| |HDMI-1|

	monitors = [
		{
			name = "DP-3";
			refreshrate = 165;
			width = 1920;
			height = 1080;
			x = 0;
			primary = true;
		}
		{
			name = "HDMI-1";
			width = 1920;
			height = 1080;
			x = 1920;
		}
	];
}
