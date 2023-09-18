{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.justin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  system.stateVersion = "22.05";

  frgd = {
    cli_apps = {
      flake.enabled = true;
    };
    tools = {
      btop.enabled = true;
    };
  }
}
