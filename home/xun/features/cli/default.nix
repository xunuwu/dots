{ pkgs, ...}:
{
	imports = [
		./zsh.nix
	];

	home.packages = with pkgs; [
		bat
		gitui
		tmux
		fzf
		ripgrep
	];
}
