{ lib, config, ... }:
with lib;
with lib.frgd;
let cfg = config.frgd.cli-apps.zellij;
in {
  options.frgd.cli-apps.zellij = { enable = mkEnableOption "zellij"; };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        theme = "gruvbox-dark";
        pane_frames = false;
      };
    };
  };
}
