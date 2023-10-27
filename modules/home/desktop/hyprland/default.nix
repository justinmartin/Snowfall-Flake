{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.desktop.hyprland;
in {
  options.frgd.desktop.hyprland = with types; {
    enable = mkBoolOpt false "hyprland";
  };

  config = mkIf cfg.enable {

    home = {
      packages = with pkgs;
        [
          # Packages installed
          capitaine-cursors-themed
        ];
    };
    xdg.configFile."hypr/hyprland.conf".source = ./config;
    gtk.cursorTheme = "Capitaine Cursors (Gruvbox)";
    frgd.desktop.addons = {
      waybar = enabled;
      swaylock = enabled;
      rofi = enabled;
      bemenu = enabled;
    };
  };
}
