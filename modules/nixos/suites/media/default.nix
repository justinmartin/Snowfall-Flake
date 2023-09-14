{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.suites.media;
in
{
  options.frgd.suites.media = with types; {
    enable = mkBoolOpt false "Whether or not to enable media configuration.";
  };

  config = mkIf cfg.enable { frgd = { apps = { freetube = enabled; }; }; };
}
