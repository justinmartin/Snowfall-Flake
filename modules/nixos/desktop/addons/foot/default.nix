{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.desktop.addons.foot;
in
{
  options.frgd.desktop.addons.foot = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome file manager.";
  };

  config = mkIf cfg.enable {
    frgd.desktop.addons.term = {
      enable = true;
      pkg = pkgs.foot;
    };

    frgd.home.configFile."foot/foot.ini".source = ./foot.ini;
  };
}
