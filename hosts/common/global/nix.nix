{ inputs, lib, ... }:

{
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];

      system-features = [ "kvm" "big-parallel" "nixos-test" ];
      flake-registry = "";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      # keep last 3 generations
      options = "--delete-older-than +3";
    };

    # Add each flake input as a registry
    # To make nix3 commands consistent with the flake
    # (i have no clue wtf that means but sure)
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
  };
}
