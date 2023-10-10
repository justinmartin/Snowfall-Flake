# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{lib, inputs,config, pkgs, ... }:
with lib;
with lib.frgd;
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
  ];

  networking.hostName = "nixos"; # Define your hostname.
  services.getty.autologinUser = "justin";

  environment.systemPackages = with pkgs; [
    helix
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  programs.git.enable = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  frgd = {
    archetypes.server.enable = true;
    security = {

      agenix = {enable = true;
      taskwarrior = enabled;
      };
    };
  };

  services.vscode-server.enable = true;
  programs.nix-ld.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?

}
