{ pkgs, ... }: {
  fontProfiles = {
    enable = true;
    monospace = {
      family = "BlexMono Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "IBMPlexMono" ]; };
    };
    regular = {
      family = "Fira Sans";
      package = pkgs.fira;
    };
  };
}
