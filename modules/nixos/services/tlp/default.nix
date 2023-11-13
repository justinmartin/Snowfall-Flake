{ options, config, lib, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.services.tlp;
in {
  options.frgd.services.tlp = with types; { enable = mkBoolOpt false "tlp"; };

  config = mkIf cfg.enable {
    services.tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_BATTERY = "powersave";
        START_CHARGE_THRESH_BAT0 = 90;
        STOP_CHARGE_THRESH_BAT0 = 97;
        RUNTIME_PM_ON_BAT = "auto";
      };
    };

  };
}

