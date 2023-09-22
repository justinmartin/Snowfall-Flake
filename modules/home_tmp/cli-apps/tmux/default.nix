{ lib, config, pkgs, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.cli-apps.tmux;
in
{
  options.frgd.cli-apps.tmux = {
    enable = mkEnableOption "Tmux";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tmux
    ];
  };
}
