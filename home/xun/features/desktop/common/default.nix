{pkgs, ...}: {
  imports = [
    ./cursor.nix
    ./discord.nix
    ./firefox.nix
    ./font.nix
    #./gtk.nix
    ./keepassxc.nix
    ./pavucontrol.nix
    ./playerctl.nix
    #./qt.nix
    ./wezterm.nix
  ];
  home.packages = with pkgs; [
    mpv
  ];
}
