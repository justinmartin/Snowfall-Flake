{ options, config, pkgs, lib, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.services.printing;
in {
  options.frgd.services.printing = with types; {
    enable = mkBoolOpt false "Whether or not to configure printing support.";
  };

  config = mkIf cfg.enable { services.printing.enable = true; };
}
