{ lib, pkgs, ... }:
with lib;
with lib.frgd; {
  imports = [ ./hardware.nix ];

  # Enable networking
  networking = {
    hostName = "nixserver";
    networkmanager.enable = true;
    interfaces.ens18.ipv4.addresses = [{
      address = "192.168.0.32";
      prefixLength = 24;
    }];
    interfaces.ens19.ipv4.addresses = [{
      address = "10.10.12.13";
      prefixLength = 24;
    }];
    defaultGateway = "192.168.0.1";
    nameservers = [ "192.168.0.1" ];
  };
  frgd = {
    archetypes.server = enabled;
    virtualization.docker = enabled;
    services = {
      tailscale.autoconnect = enabled;
      taskserver = enabled;
      syncthing = enabled;
      vikunja = enabled;
    };
    user.extraGroups = [ "docker" ];
    security = {
      sops = {
        enable = true;
        taskwarrior = enabled;
      };
    };
    system.boot.grub = true;
  };
}
