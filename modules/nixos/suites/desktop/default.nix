{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.suites.desktop;
in {
  options.frgd.suites.desktop = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common desktop configuration.";
  };

  config = mkIf cfg.enable {
    frgd = {
      desktop = {
        #        gnome = enabled;
        hyprland = enabled;
        #        addons = { wallpapers = enabled; };
      };

      apps = {
        _1password = enabled;
        vlc = enabled;
        # logseq = enabled;
        # pocketcasts = enabled;
        # yt-music = enabled;
        # gparted = enabled;
      };
    };
  };
}
