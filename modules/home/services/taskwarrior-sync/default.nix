{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.frgd.services.taskwarrior-sync;
in {
  options.frgd.services.taskwarrior-sync = {
    enable = mkEnableOption "Enable Taskwarrior Sync service";
  };

  config = mkIf cfg.enable { services.taskwarrior-sync.enable = true; };
}
