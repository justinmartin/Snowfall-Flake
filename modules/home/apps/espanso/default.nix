{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.frgd.apps.espanso;
in {
  options.frgd.apps.espanso = { enable = mkEnableOption "Espanso"; };

  config = mkIf cfg.enable {
    services.espanso.enable = true;
    
    #TODO setup home-manager config
  };
}
