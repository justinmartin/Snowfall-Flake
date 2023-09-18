# Hyprland configuration
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ ./<host>
#   │       └─ default.nix
#   └─ ./modules
#       └─ ./desktop
#           └─ ./hyprland
#               └─ default.nix *
#

{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.frgd.desktop.hyprland;
in {
  options.frgd.cli-apps.hyprland = {
    enable = mkEnableOption "Enable the Hyprland window manager";
  };

  config = mkIf cfg.enable {

    #TODO imports = [ ../../programs/waybar.nix ];

    services.dbus.enable = true;

    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };

    environment = {
      loginShellInit = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          exec Hyprland
        fi
      ''; # Will automatically open Hyprland when logged into tty1

      variables = {
        #WLR_NO_HARDWARE_CURSORS=1;         # Possible variables needed in vm
        #WLR_RENDERER_ALLOW_SOFTWARE=1;
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "Hyprland";
      };
      systemPackages = with pkgs; [
        grim
        mpvpaper
        slurp
        swappy
        wl-clipboard
        wlr-randr
      ];
    };

    programs = { hyprland.enable = true; };

  };
}
