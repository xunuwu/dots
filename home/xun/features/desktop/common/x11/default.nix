{pkgs, ...}: {
  home.packages = with pkgs; [
    xclip
    polkit_gnome
  ];
}
