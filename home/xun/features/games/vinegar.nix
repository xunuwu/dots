{ pkgs, ...}:
let 
	vinegar = pkgs.vinegar.override {
		wine = pkgs.inputs.nix-gaming.wine-ge;
	};
in
{
	home.packages = [
		vinegar
	];
	xdg.configFile."vinegar/config.toml".text = ''
#multiple_instances = true

[player]
renderer = "D3D11"
dxvk = true
auto_kill_prefix = true

[player.fflags]
DFIntTaskSchedulerTargetFps = 165
'';

}
