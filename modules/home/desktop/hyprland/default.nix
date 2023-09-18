{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.frgd.desktop.hyprland;

  confFile = with host; ''

    MONITORS
    monitor=eDP-1,1920x1080@60,1920x0,1

    general {
      sensitivity=1
      #main_mod=MOD4
      border_size=4
      gaps_in=5
      gaps_out=7
      col.active_border=rgba(fe8019bb) rgba(8ec07cbb) 60deg
      col.inactive_border=rgba(fe801922) rgba(8ec07c22) 60deg
      layout=dwindle
    }

    decoration {
      rounding=5
      multisample_edges=true
      #active_opacity=0.93
      #inactive_opacity=0.93
      fullscreen_opacity=1
      drop_shadow=false
    }

    animations {
      enabled=true
      bezier = myBezier,0.1,0.7,0.1,1.05
      animation=fade,1,7,default
      animation=windows,1,7,myBezier
      animation=windowsOut,1,3,default,popin 60%
      animation=windowsMove,1,7,myBezier
    }

    input {
      kb_layout=us
      follow_mouse=2
      repeat_delay=250
      numlock_by_default=0
      force_no_accel=1
      sensitivity=1
      touchpad {
        clickfinger_behavior = true
        tap-to-click = false

      }
    }

    dwindle {
      pseudotile=false
      force_split=2
    }

    gestures {
      workspace_swipe=true
    }

    misc {
      disable_splash_rendering=true
    }

    bindm=SUPER,mouse:272,movewindow
    bindm=SUPER,mouse:273,resizewindow

    bind=SUPER,Return,exec,${pkgs.foot}/bin/footclient
    bind=SUPERSHIFT,Return,exec,${pkgs.google-chrome}/bin/google-chrome-stable
    bind=SUPERSHIFT,Q,killactive,
    bind=SUPER,Escape,exit,
    bind=SUPER,E,exec,${pkgs.pcmanfm}/bin/pcmanfm
    bind=SUPER,H,togglefloating,
    bind=SUPER,Space,exec,${pkgs.rofi}/bin/rofi -show drun
    bind=SUPER,P,pseudo,
    bind=SUPER,F,fullscreen,
    bind=SUPER,R,forcerendererreload
    bind=SUPERSHIFT,R,exec,${pkgs.hyprland}/bin/hyprctl reload
    bind=SUPERSHIFT,L,exec,${pkgs.swaylock-effects}/bin/swaylock

    bind=SUPER,left,movefocus,l
    bind=SUPER,right,movefocus,r
    bind=SUPER,up,movefocus,u
    bind=SUPER,down,movefocus,d

    bind=SUPERSHIFT,left,movewindow,l
    bind=SUPERSHIFT,right,movewindow,r
    bind=SUPERSHIFT,up,movewindow,u
    bind=SUPERSHIFT,down,movewindow,d

    bind=SUPER,1,workspace,1
    bind=SUPER,2,workspace,2
    bind=SUPER,3,workspace,3
    bind=SUPER,4,workspace,4
    bind=SUPER,5,workspace,5
    bind=SUPER,6,workspace,6
    bind=SUPER,7,workspace,7
    bind=SUPER,8,workspace,8
    bind=SUPER,9,workspace,9
    bind=SUPER,0,workspace,10
    bind=SUPER,right,workspace,+1
    bind=SUPER,left,workspace,-1

    bind=SUPERSHIFT,1,movetoworkspace,1
    bind=SUPERSHIFT,2,movetoworkspace,2
    bind=SUPERSHIFT,3,movetoworkspace,3
    bind=SUPERSHIFT,4,movetoworkspace,4
    bind=SUPERSHIFT,5,movetoworkspace,5
    bind=SUPERSHIFT,6,movetoworkspace,6
    bind=SUPERSHIFT,7,movetoworkspace,7
    bind=SUPERSHIFT,8,movetoworkspace,8
    bind=SUPERSHIFT,9,movetoworkspace,9
    bind=SUPERSHIFT,0,movetoworkspace,10
    bind=SUPERSHIFT,right,movetoworkspace,+1
    bind=SUPERSHIFT,left,movetoworkspace,-1

    bind=CTRL,right,resizeactive,20 0
    bind=CTRL,left,resizeactive,-20 0
    bind=CTRL,up,resizeactive,0 -20
    bind=CTRL,down,resizeactive,0 20

    bind=,print,exec,${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f - -o ~/Pictures/$(date +%Hh_%Mm_%Ss_%d_%B_%Y).png && notify-send "Saved to ~/Pictures/$(date +%Hh_%Mm_%Ss_%d_%B_%Y).png"

    bind=,XF86AudioLowerVolume,exec,${pkgs.pamixer}/bin/pamixer -d 10
    bind=,XF86AudioRaiseVolume,exec,${pkgs.pamixer}/bin/pamixer -i 10
    bind=,XF86AudioMute,exec,${pkgs.pamixer}/bin/pamixer -t
    bind=,XF86AudioMicMute,exec,${pkgs.pamixer}/bin/pamixer --default-source -t
    bind=,XF86MonBrightnessDown,exec,${pkgs.light}/bin/light -U 5
    bind=,XF86MonBrightnessUP,exec,${pkgs.light}/bin/light -A 5

    #Suspend when laptop is closed
    bindl=,switch:[Lid Switch],exec, "systemctl suspend"


    windowrule=float,^(Rofi)$
    windowrule=float,title:^(Volume Control)$
    windowrule=float,title:^(Picture-in-Picture)$
    windowrule=pin,title:^(Picture-in-Picture)$
    windowrule=move 75% 75% ,title:^(Picture-in-Picture)$
    windowrule=size 24% 24% ,title:^(Picture-in-Picture)$

    exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec-once=${pkgs.swaybg}/bin/swaybg -m center -i $HOME/flake/modules/themes/wall.png
    exec-once=${pkgs.waybar}/bin/waybar
    #exec-once=${pkgs.blueman}/bin/blueman-applet
    exec-once = foot --server &
    exec-once = swayidle -w & disown
    exec-once = swayidle -w timeout 300 'swaylock -fF' timeout 600 'hyprctl dispatch dpms' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -fF'
    exec-once = hyprctl setcursor "Capitaine Cursors (Gruvbox)" 14
    exec-once = udiskie &:

  '';

  hyprlandConf = with host;
    builtins.replaceStrings [ "MONITORS" ]
    [ (if hostName == "probook" then "" else false) ] "${confFile}";

in {
  options.frgd.desktop.hyprland = {
    enable = mkEnableOption "Hyprland Home Manager settings";
  };

  config = mkIf cfg.enable { };
}

{
  #xdg.configFile."hypr/hyprland.conf".text = "${hyprlandConf}";
  xdg.configFile."hypr/hyprland.conf".text = hyprlandConf;

  #colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  #gtk.cursorTheme.package = pkgs.capitaine-cursors-themed;
  gtk.cursorTheme = "Capitaine Cursors (Gruvbox)";

}
