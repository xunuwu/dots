{ config, pkgs, ... }:
let
	color = pkgs.writeText "color.vim" (import ./theme.nix config.colorscheme);
in
{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
	};

	xdg.configFile."nvim/" = {
		source = ./config;
		recursive = true;
	};

	home.sessionVariables.EDITOR = "nvim";
}
