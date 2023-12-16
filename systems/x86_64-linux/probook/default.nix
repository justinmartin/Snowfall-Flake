{ ... }:

{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "22.05";

  frgd = { archetypes.server.enable = true; };
}
