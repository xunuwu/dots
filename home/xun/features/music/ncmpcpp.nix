{pkgs, ...}: let
  new-ncmpcpp = pkgs.ncmpcpp.override {
    visualizerSupport = true;
    clockSupport = true;
  };
in {
  programs.ncmpcpp = {
    enable = true;
    package = new-ncmpcpp;
    settings = {
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "my_fifo";
      visualizer_in_stereo = "yes";
      visualizer_type = "spectrum";
      visualizer_look = "●▮";
      lyrics_fetchers = builtins.concatStringsSep "," [
        "musixmatch"
        "sing365"
        "metrolyrics"
        "justsomelyrics"
        "jahlyrics"
        "plyrics"
        "tekstowo"
        "zeneszoveg"
        "internet"
      ];
    };
  };
}
