{ lib, config, pkgs, osConfig ? { }, ... }:

let
  inherit (lib) types mkIf mkDefault mkMerge;
  inherit (lib.frgd) mkOpt;

  cfg = config.frgd.user;

  is-linux = pkgs.stdenv.isLinux;
  is-darwin = pkgs.stdenv.isDarwin;

  home-directory = if cfg.name == null then
    null
  else if is-darwin then
    "/Users/${cfg.name}"
  else
    "/home/${cfg.name}";
in {
  options.frgd.user = {
    enable = mkOpt types.bool false "Whether to configure the user account.";
    name =
      mkOpt (types.nullOr types.str) config.frgd.user.name "The user account.";

    fullName = mkOpt types.str "Justin Martin" "The full name of the user.";
    email = mkOpt types.str "jus10mar10@gmail.com" "The email of the user.";

    home = mkOpt (types.nullOr types.str) home-directory
      "The user's home directory.";
  };

  config = mkIf cfg.enable (mkMerge [{
    assertions = [
      {
        assertion = cfg.name != null;
        message = "frgd.user.name must be set";
      }
      {
        assertion = cfg.home != null;
        message = "frgd.user.home must be set";
      }
    ];

    home = {
      username = mkDefault cfg.name;
      homeDirectory = mkDefault cfg.home;
      sessionVariables = { EDITOR = "nvim"; };

    };

  }]);
}
