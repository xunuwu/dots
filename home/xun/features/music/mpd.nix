{pkgs, ...}: {
  services.mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Sound Server"
      }

      audio_output {
        type   "fifo"
        name   "my_fifo"
        path   "/tmp/mpd.fifo"
        format "44100:16:2"
      }

      replaygain "track"
    '';
  };
  home.packages = [pkgs.mpc-cli];
}
