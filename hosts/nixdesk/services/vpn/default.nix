{config, ...}: {
  networking.wg-quick.interfaces."wg0".configFile = config.sops.secrets.wireguard.path;
  #services.openvpn.servers = {
  #  mainVPN = {
  #    config = "config " + config.sops.secrets.openvpn.path;
  #  };
  #};

  sops.secrets.wireguard = {
    format = "binary";
    sopsFile = ./wireguard;
  };
  sops.secrets.openvpn = {
    format = "binary";
    sopsFile = ./openvpn;
  };
}
