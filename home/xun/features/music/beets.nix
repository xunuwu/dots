{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [ffmpeg];
  programs.beets = {
    enable = true;
    settings = {
      directory = config.services.mpd.musicDirectory;
      library = config.xdg.dataHome + "/beets/library.db";
      import.move = true;
      threaded = true;
      plugins = [
        "unimported"
        "missing"
        "info"
        "replaygain"
        "lyrics"
      ];
      replaygain = {
        auto = true;
        backend = "ffmpeg";
      };
    };
    mpdIntegration = {
      #enableStats = true; # dosent work for some reason, TODO maybe fix this
      enableUpdate = true;
    };
  };
}
