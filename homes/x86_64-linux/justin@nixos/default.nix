{ lib, pkgs, config, osConfig ? { }, format ? "unknown", ... }:
with lib;
with lib.frgd; {
  frgd = {
    user = {
      enable = true;
      name = "justin";
    };

    cli-apps = {
      zsh = enabled;
      neovim = enabled;
      home-manager = enabled;
      tmux = enabled;
      bottom = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
      misc = enabled;
    };
  };
}
