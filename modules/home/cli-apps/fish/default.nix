{ lib, config, pkgs, ... }:
with lib;
with lib.frgd;
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
      # shellInit = "op completion fish | source";
    };
    programs.direnv = { enable = true; };

    home.packages = with pkgs.fishPlugins; [
      z
      #hydro
      fzf
      done
      hydro
      colored-man-pages
      pkgs.nerdfonts
      pkgs.nerd-font-patcher
      pkgs.powerline
      pkgs.powerline-fonts
    ];

    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        format =
          "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
        shlvl = {
          disabled = false;
          symbol = "ﰬ";
          style = "bright-red bold";
        };
        shell = {
          disabled = false;
          format = "$indicator";
          fish_indicator = "";
          bash_indicator = "[BASH](bright-white) ";
          zsh_indicator = "[ZSH](bright-white) ";
        };
        username = {
          style_user = "bright-white bold";
          style_root = "bright-red bold";
        };
      };
    };
    home.sessionVariables = {
      theme_nerd_fonts = "yes";
      theme_color_scheme = "gruvbox";
    };

  };
}
