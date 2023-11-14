{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.apps.google-chrome;
in {
  options.frgd.apps.google-chrome = with types; {
    enable = mkBoolOpt false "Whether or not to enable firefox.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ google-chrome ];
  };
}
