{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.services.espanso;
in
{
  options.frgd.services.espanso = with types; {
    enable = mkBoolOpt false "espanso";
    western_snippets = {
      enable = mkBoolOpt false "Enable Western snippets";
    };

  };

  config = mkIf cfg.enable {
    services.espanso.enable = true;

    xdg.configFile."espanso/config/default.yml".source = ./config.yml;
    xdg.configFile."espanso/matches/base.yml".source = ./matches.yml;

    xdg.configFile."espanso/matches/western.yml" = mkIf cfg.western_snippets.enable {
      source = ./western.yml;
    };

  };
}
