{pkgs, ...}: {
  imports = [
    ./mpd.nix
    ./yams.nix
    ./ncmpcpp.nix
    ./beets.nix
    ./spotify.nix
  ];
}
