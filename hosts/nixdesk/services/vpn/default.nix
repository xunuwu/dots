{config, ...}: {
  networking.wg-quick.interfaces."wg0".configFile = config.sops.secrets.vpn-conf.path;
  sops.secrets.vpn-conf = {
    format = "binary";
    sopsFile = ./config;
  };
}
