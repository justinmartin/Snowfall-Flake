{ lib, config, ... }:
with lib;
with lib.frgd;
let

  cfg = config.frgd.cli-apps.starship;
in {
  options.frgd.cli-apps.starship = { enable = mkEnableOption "starship"; };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}

