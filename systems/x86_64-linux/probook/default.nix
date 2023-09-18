{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "22.05";
}
