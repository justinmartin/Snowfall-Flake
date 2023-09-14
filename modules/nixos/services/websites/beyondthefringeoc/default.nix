{ lib, pkgs, config, ... }:

let
  inherit (lib) mkIf mkEnableOption fetchFromGitHub foldl;
  inherit (lib.frgd) mkOpt;

  cfg = config.frgd.services.websites.beyondthefringeoc;
in
{
  options.frgd.services.websites.beyondthefringeoc = with lib.types; {
    enable = mkEnableOption "Beyond The Fringe OC Website";
    package = mkOpt package pkgs.frgd.beyondthefringeoc-website "The site package to use.";
    domains = mkOpt (listOf str) [ "beyondthefringeoc.com" "hairbyjanine.com" ] "The domain to serve the website site on.";

    acme = {
      enable = mkOpt bool true "Whether or not to automatically fetch and configure SSL certs.";
    };
  };

  config = mkIf cfg.enable {
    services.nginx = {
      enable = true;

      virtualHosts = foldl
        (hosts: domain: hosts // {
          "${domain}" = {
            enableACME = cfg.acme.enable;
            forceSSL = cfg.acme.enable;

            locations."/" = {
              root = cfg.package;
            };
          };
        })
        { }
        cfg.domains;
    };
  };
}
