{ lib, config, pkgs, ... }: {
	imports = [
		../common
	];
	xdg.configFile."awesome/" = {
		source = ./config;
		recursive = true;
	};
}
