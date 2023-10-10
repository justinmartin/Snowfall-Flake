{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.frgd.cli-apps.fish;
in {
  options.frgd.cli-apps.fish = { enable = mkEnableOption "fish"; };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        fs = "sudo nixos-rebuild switch --flake ~/flake#";
        ds = "darwin-rebuild switch --flake ~/flake#";
      };
      shellInit = "op completion fish | source";
    };
    programs.direnv = { enable = true; };

    home.packages = with pkgs.fishPlugins; [
      z
      #hydro
      fzf
      #done
      hydro
      pkgs.nerdfonts
      pkgs.nerd-font-patcher
      pkgs.powerline
      pkgs.powerline-fonts
    ];

    home.sessionVariables = {
      theme_nerd_fonts = "yes";
      theme_color_scheme = "gruvbox";
    };

  };
}
