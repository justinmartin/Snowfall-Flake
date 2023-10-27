{ lib, pkgs, config, osConfig ? { }, format ? "unknown", ... }:
with lib;
with lib.frgd; {
  frgd = {
    user = {
      enable = true;
      name = "justin";
    };
    desktop = { hyprland = enabled; };
    cli-apps = {
      zsh = enabled;
      neovim = enabled;
      home-manager = enabled;
      tmux = enabled;
      bottom = enabled;
      ranger = enabled;
      fish = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
      misc = enabled;
    };
  };
}
