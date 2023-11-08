{ inputs, lib, pkgs, config, outputs, ... }:
let
	inherit (inputs.nix-colors) colorSchemes;
in
{
	imports = [
		inputs.nix-colors.homeManagerModule
		#../features/cli
		../features/nvim
	] ++ (builtins.attrValues outputs.homeManagerModules);

	nixpkgs = {
		overlays = builtins.attrValues outputs.overlays;
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};

	nix = {
		package = lib.mkDefault pkgs.nix;
		settings = {
			experimental-features = [ "nix-command" "flakes" "repl-flake" ];
		};
	};

	systemd.user.startServices = "sd-switch";

	programs = {
		home-manager.enable = true;
		git.enable = true;
	};

	home = {
		username = lib.mkDefault "xun";
		homeDirectory = lib.mkDefault "/home/${config.home.username}";
		stateVersion = lib.mkDefault "23.11";
		sessionPath = [ "$HOME/.local/bin" ];
	};

	colorscheme = lib.mkDefault colorSchemes.catppuccin-mocha;
	home.file.".colorscheme".text = config.colorscheme.slug;
}
