{ config, lib, ... }:
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;
    group = "users";

    settings.devices = {
      "nixdesk" = {
        id = "2WCEQPF-2J4U7IK-XRT25FV-NFT2JEM-AVOMDEK-FIJNZ24-7WCBZC2-57CX2AP";
        autoAcceptFolders = true;
        addresses = [ "tcp://192.168.50.26:51820" "tcp://nixdesk:51820"];
      };
      "redmi-note-10-pro" = {
        id = "U6YYTHR-2ZXIEXQ-RNDERSF-CTVSP67-W24VK4Y-5EQRIV5-T7JJW2N-33L7XQV";
        autoAcceptFolders = true;
        addresses = [ "tcp://192.168.50.26:51820" "tcp://redmi-note-10-pro:51820"];
      };
      "hopper" = {
        id = "DK3RPET-ACMULD2-TLQS6YM-XWUMS3N-JRNDNME-YTM3H4X-P7QVUKB-N3PL5QF";
        autoAcceptFolders = true;
        addresses = [ "tcp://192.168.50.97:51820" "tcp://hopper:51820"];
      };
    };

    settings.folders = {
      "secrets" = {
        id = "gpfyz-eiwmj";
        path = "~/secrets";
        devices = [ "nixdesk" "redmi-note-10-pro" "hopper" ];
        fsWatcherEnabled = "true";
        fsWatcherDelayS = "60";
        versioning = {
          type = "simple";
          params.keep = "15"; # old version count to keep
        };
      };
    };


    settings.options.urAccepted = -1; # disable usage reporting
    settings.options.globalAnnounceEnabled = false; # only sync on LAN
    settings.gui.insecureSkipHostcheck = true;
    settings.gui.insecureAdminAccess = true;
  };
}
