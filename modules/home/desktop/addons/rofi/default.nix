{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.desktop.addons.rofi;
in
{
  options.frgd.desktop.addons.rofi = with types; {
    enable = mkBoolOpt false "rofi";
  };

  config = mkIf cfg.enable {
    
  };
}
