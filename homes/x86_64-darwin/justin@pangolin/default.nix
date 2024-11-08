{ lib, ... }:
with lib;
with lib.frgd; {
  frgd = {
    services = { espanso = { enable = true; }; };

    cli-apps = {
      neovim = enabled;
      home-manager = enabled;
      tmux = enabled;
      system-monitors = enabled;
      taskwarrior = enabled;
      #zellij = enabled;
      #fish = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
      bat = enabled;
      misc = enabled;
      charms = enabled;
    };
  };

  home.stateVersion = "24.05";

}
