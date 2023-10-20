{ lib, config, pkgs, ... }:
with lib;
with lib.frgd; {
  services.nix-daemon.enable = true;
   environment.shells = with pkgs; [
    fish
    zsh
  ];

  frgd = { homebrew = enabled; nix-darwin = enabled;};
}

