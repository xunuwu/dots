{pkgs, ...}: {
  imports = [
    ./mpd.nix
    ./yams.nix
    ./ncmpcpp.nix
    ./beets.nix
  ];
  home.packages = with pkgs; [
    spotify
  ];
}
