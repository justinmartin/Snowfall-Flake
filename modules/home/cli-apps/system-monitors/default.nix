{ lib, config, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.frgd) enabled;

  cfg = config.frgd.cli-apps.system-monitors;
in {
  options.frgd.cli-apps.system-monitors = {
    enable = mkEnableOption "Enable System Monitors";
  };

  config = mkIf cfg.enable {
    # programs.htop = enabled;
    programs.btop = enabled;
    programs.bottom = enabled;
  };
}
