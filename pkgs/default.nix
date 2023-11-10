{ pkgs ? import <nixpks> {} }: rec {
	# add stuff here later idk
	# example stuff to add is in
	# https://github.com/Misterio77/nix-config/blob/main/pkgs/default.nix
	vinegar = pkgs.callPackage ./vinegar {
		#wine = pkgs.wineWowPackages.staging.overrideDerivation (oldAttrs: {
		#	patches = (oldAttrs.patches or []) ++ [
		#		(pkgs.fetchpatch {
		#			url = "https://raw.githubusercontent.com/flathub/io.github.vinegarhq.Vinegar/4f2d744c80477e54426299aa171c1f0ea8282d27/patches/wine/segregrevert.patch";
		#			hash = "sha256-GTOBKnvk3JUuoykvQlOYDLt/ohCeqJfugnQnn7ay5+w=";
		#		})
		#	];
		#});
		wine = pkgs.wineWowPackages.staging;
	};
}
