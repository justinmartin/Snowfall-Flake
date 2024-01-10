{ lib, pkgs, ... }:
with lib;
with lib.frgd; {
  imports = [ ./hardware.nix ./disko.nix ];

  # Enable networking
  networking = {
    networkmanager.enable = true;
    interfaces.enp4s0.ipv4.addresses = [{
      address = "192.168.0.35";
      prefixLength = 24;
    }];
    defaultGateway = "192.168.0.1";
    nameservers = [ "192.168.0.1" ];
  };
  frgd = {
    archetypes.server = enabled;
    services = { syncthing = enabled; };
    system.boot.efi = true;
  };
}
