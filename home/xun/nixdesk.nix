{ inputs, outputs, ... }: {
	imports = [
		./global
		./features/games
	];

	colorscheme = inputs.nix-colors.colorschemes.oxocarbon-dark;
	
	# |DP-3| |HDMI-1|

	monitors = [
		{
			name = "DP-3";
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
