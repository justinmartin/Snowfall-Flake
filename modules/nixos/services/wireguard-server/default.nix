{ config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.services.wireguard-server;
in {
  options.frgd.services.wireguard-server = with types; {
    enable = mkBoolOpt false "Wireguard";
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedUDPPorts = [ 51820 ];
    networking.useNetworkd = true;
    systemd.network = {
      enable = true;
      netdevs = {
        "50-wg0" = {
          netdevConfig = {
            Kind = "wireguard";
            Name = "wg0";
            MTUBytes = "1300";
          };
          wireguardConfig = {
            PrivateKeyFile =
              config.sops.secrets.wireguard_server_private_key.path;
            ListenPort = 51820;
          };
          wireguardPeers = [{
            wireguardPeerConfig = {
              PublicKey = "c6wHcfH5yIf7J6N57zYLrtuxl9/YE09nRCw4HKDl3Wc=";
              AllowedIPs = [ "10.100.0.2" ];
            };
          }];
        };
      };
      networks.wg0 = {
        matchConfig.Name = "wg0";
        address = [ "10.100.0.1/24" ];
        networkConfig = {
          IPMasquerade = "ipv4";
          IPForward = true;
        };
      };
    };
  };

}
