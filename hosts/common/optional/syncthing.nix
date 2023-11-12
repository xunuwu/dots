{ config, lib, ... }:
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;

    settings.devices = {
      "nixdesk" = {
        id = "2WCEQPF-2J4U7IK-XRT25FV-NFT2JEM-AVOMDEK-FIJNZ24-7WCBZC2-57CX2AP";
      };
      "redmi-note-10-pro" = {
        id = "U6YYTHR-2ZXIEXQ-RNDERSF-CTVSP67-W24VK4Y-5EQRIV5-T7JJW2N-33L7XQV";
      };
    };

    settings.options.urAccepted = -1; # disable usage reporting
    settings.options.globalAnnounceEnabled = false; # only sync on LAN
    settings.gui.insecureSkipHostcheck = true;
    settings.gui.insecureAdminAccess = true;
  };
}
