{ options, config, pkgs, lib, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.desktop.addons.wallpapers;
  inherit (pkgs.frgd) wallpapers;
in
{
  options.frgd.desktop.addons.wallpapers = with types; {
    enable = mkBoolOpt false
      "Whether or not to add wallpapers to ~/Pictures/wallpapers.";
  };

  config = {
    frgd.home.file = lib.foldl
      (acc: name:
        let wallpaper = wallpapers.${name};
        in
        acc // {
          "Pictures/wallpapers/${wallpaper.fileName}".source = wallpaper;
        })
      { }
      (wallpapers.names);
  };
}
