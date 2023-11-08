# everything is somewhat stolen from Misterio77's config

{
	description = "xun's nixos system config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		hardware.url = "github:nixos/nixos-hardware";
		nix-colors.url = "gihub:misterio77/nix-colors";

		sops-nix = {
			url = "github:mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.nixpkgs-table.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager";
		};

		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		# other inputs go here later :))
	};

	outputs = { self, nixpkgs, home-manager, ... } @inputs:
	let
		inherit (self) outputs;
		lib = nixpkgs.lib // home-manager.lib;
		systems = [ "x86_64-linux" ]; # add more in future mayb
		forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
		pkgsFor = lib.genAttrs systems (system: import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		});
	in {
		inherit lib;
		nixosModules = import ./modules/nixos;
		homeManagerModules = import ./modules/home-manager;
		
		overlays = import ./overlays { inherit inputs outputs; };
		
		packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
		devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs; });
		formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

		nixosConfigurations = {
			# desktop
			nixdesk = lib.nixosSystem {
				modules = [ ./hosts/nixdesk ];
				specialArgs = { inherit inputs outputs; };
			};
			# dell server i have on my floor
			xundell = lib.nixosSystem {
				modules = [ ./hosts/xundell ];
				specialArgs = { inherit inputs outputs; };
			};
		};
		
		homeConfigurations = {
			"xun@nixdesk" = lib.homeManagerConfiguration {
				modules = [ ./home/xun/nixdesk.nix ];
				pkgs = pkgsFor.x86_64-linux;
				extraSpecialArgs = { inherit inputs outputs; };
			};
			"xun@xundell" = lib.homeManagerConfiguration {
				modules = [ ./home/xun/xundell.nix ];
				pkgs = pkgsFor.x86_64-linux;
				extraSpecialArgs = { inherit inputs outputs; };
			};
			"xun@generic" = lib.homeManagerConfiguration {
				modules = [ ./home/xun/generic.nix ];
				pkgs = pkgsFor.x86_64-linux;
				extraSpecialArgs = { inherit inputs outputs; };
			};
		};
	};
}
