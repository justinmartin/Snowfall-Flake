{ options, config, lib, pkgs, ... }:

with lib;
with lib.frgd;
let cfg = config.frgd.services.forgejo;
in {
  options.frgd.services.forgejo = with types; {
    enable = mkBoolOpt false "Whether or not to enable forgejo.";
  };

  config = mkIf cfg.enable {
    services = {
      gitea = {
        enable = true;
        package = pkgs.forgejo;
        settings.server.ROOT_URL = "http://gitea.frgd.us:3000";
        #useWizard = true;
      };
    };
  };
}

