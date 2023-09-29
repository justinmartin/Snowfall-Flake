{ lib, config, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.frgd) enabled;

  cfg = config.frgd.cli-apps.bottom;
in
{
  options.frgd.cli-apps.bottom= {
    enable = mkEnableOption "bottom";
  };

  config = mkIf cfg.enable {
    programs.htop = enabled;
  };
}
