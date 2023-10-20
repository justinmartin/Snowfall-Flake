{ options, config, lib, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.desktop.plasma;
in
{
  options.frgd.desktop.plasma = with types; {
    enable = mkBoolOpt false "plasma";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
  };
}

