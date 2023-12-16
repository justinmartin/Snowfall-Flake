{ lib, pkgs, ... }:
with lib;
with lib.frgd; {
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "23.05";

  frgd = {
    system.boot = {
      enable = true;
      efi = true;
    };
    archetypes.workstation = enabled;
    archetypes.gaming = enabled;
    services.klipper = enabled;

    desktop = { addons = { swaylock = enabled; }; };
  };
}
