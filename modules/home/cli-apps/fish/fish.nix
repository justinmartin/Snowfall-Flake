{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      tl = "task list";
      ta = "task add";
      fs = "sudo nixos-rebuild switch --flake ~/flake#";
      ds = "darwin-rebuild switch --flake ~/flake#";
      tw = "taskwarrior-tui";
    };
    #shellInit = "op completion fish | source";
  };
  programs.direnv = { enable = true; };

  home.packages = with pkgs.fishPlugins; [
    z
    #hydro
    fzf
    done
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
}
