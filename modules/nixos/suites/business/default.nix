{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.suites.business;
in
{
  options.frgd.suites.business = with types; {
    enable = mkBoolOpt false "Whether or not to enable business configuration.";
  };

  config =
    mkIf cfg.enable { frgd = { apps = { frappe-books = enabled; }; }; };
}
