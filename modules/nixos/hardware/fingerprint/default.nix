{ options, config, pkgs, lib, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.hardware.fingerprint;
in
{
  options.frgd.hardware.fingerprint = with types; {
    enable = mkBoolOpt false "Whether or not to enable fingerprint support.";
  };

  config = mkIf cfg.enable { services.fprintd.enable = true; };
}
