{ lib, config, pkgs, ... }:

let
  inherit (lib) types mkEnableOption mkIf;
  inherit (lib.frgd) mkOpt enabled;

  cfg = config.frgd.tools.git;
  user = config.frgd.user;
in {
  options.frgd.tools.git = {
    enable = mkEnableOption "Git";
    userName = mkOpt types.str user.fullName "The name to configure git with.";
    userEmail = mkOpt types.str user.email "The email to configure git with.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      inherit (cfg) userName userEmail;
      lfs = enabled;

      extraConfig = {
        init = { defaultBranch = "main"; };
        pull = { rebase = true; };
        push = { autoSetupRemote = true; };
        core = { whitespace = "trailing-space,space-before-tab"; };
      };
    };
    home.packages = with pkgs; [ lazygit ];
  };
}
