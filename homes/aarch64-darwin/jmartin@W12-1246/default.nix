{ lib, pkgs, config, osConfig ? { }, format ? "unknown", ... }:
with lib;
with lib.frgd; {
  frgd = {
    cli-apps = {
      #zsh = enabled;
      neovim = enabled;
      home-manager = enabled;
      tmux = enabled;
      bottom = enabled;
      taskwarrior = enabled;
      #zellij = enabled;
      # starship = enabled;
      fish = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
      #misc = enabled;
    };
  };

  home.stateVersion = "23.05";

}

