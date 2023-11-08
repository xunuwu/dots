# TODO remake config to have dynamic theme with nix-colors
# base16-builder on github has examples

{ lib, config, pkgs, ... }: {
	imports = [
		../common
	];
	services.xserver ={
		enable = true;
		windowManager.awesome.enable = true;
	};
	xdg.configFile."awesome/" = {
		source = "./config";
		recursive = true;
	};
}
