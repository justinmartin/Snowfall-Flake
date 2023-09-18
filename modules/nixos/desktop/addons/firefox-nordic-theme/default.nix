{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.desktop.addons.firefox-nordic-theme;
  profileDir = ".mozilla/firefox/${config.frgd.user.name}";
in
{
  options.frgd.desktop.addons.firefox-nordic-theme = with types; {
    enable = mkBoolOpt false "Whether to enable the Nordic theme for firefox.";
  };

  config = mkIf cfg.enable {
    frgd.apps.firefox = {
      extraConfig = builtins.readFile
        "${pkgs.frgd.firefox-nordic-theme}/configuration/user.js";
      userChrome = ''
        @import "${pkgs.frgd.firefox-nordic-theme}/userChrome.css";
      '';
    };
  };
}
