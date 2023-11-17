{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  steam-with-pkgs = pkgs.steam.override {
    extraPkgs = pkgs:
      with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
        gamescope
        gamemode
        mangohud
      ];
    extraProfile = "export STEAM_EXTRA_COMPAT_TOOLS_PATHS='${inputs.nix-gaming.packages.${pkgs.system}.proton-ge}'";
  };

  monitor = lib.head (lib.filter (m: m.primary) config.monitors);
  steam-session = pkgs.writeTextDir "share/wayland-sessions/steam-sesson.desktop" ''
    [Desktop Entry]
    Name=Steam Session
    Exec=${pkgs.gamescope}/bin/gamescope -W ${toString monitor.width} -H ${toString monitor.height} -O ${monitor.name} -e -- steam -gamepadui
    Type=Application
  '';
in {
  home.packages = with pkgs; [
    steam-with-pkgs
    steam-session
    gamescope
    mangohud
    gamemode
    protontricks
  ];
}
