{ lib, config, ... }:
{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = lib.mkDefault "client";
  };
  networking.firewall = {
    checkReversePath = "loose";
    allowedUDPPorts = [ config.services.tailscale.port ];
    allowedTCPPorts = [ 22 ]; # allow ssh through tailscale
  };
}
