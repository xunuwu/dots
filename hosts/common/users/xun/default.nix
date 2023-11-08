{ pkgs, config, ...}:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
	users.mutableUsers = false;
	users.users.xun = {
		isNormalUser = true;
		shell = pkgs.zsh;
		extraGroups = [
			"wheel"
			"video"
			"audio"
		] ++ ifTheyExist [
			"network"
			"git"
			"libvirtd"
		];
		packages = [ pkgs.home-manager ];
	};

	home-manager.users.xun = import ../../../../home/xun/${config.networking.hostName}.nix;
}
