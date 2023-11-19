{config, ...}: let
  home = config.home.homeDirectory;
in {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = home + "/desktop";
    documents = home + "/docs";
    download = home + "/down";
    music = home + "/music";
    pictures = home + "/pics";
    publicShare = home + "/share";
    videos = home + "/vids";
  };
}
