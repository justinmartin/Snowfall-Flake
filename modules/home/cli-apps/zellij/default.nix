{ lib, config, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.frgd) enabled;

  cfg = config.frgd.cli-apps.zellij;
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
