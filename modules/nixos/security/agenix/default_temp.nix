{ lib, config, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.frgd.security.agenix;
in {
  options.frgd.security.agenix = {
    enable = mkEnableOption "Agenix";

    taskwarrior = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Taskwarrior Secrets";
    };

  };
  config = mkIf cfg.enable {
    imports = [ inputs.agenix.nixosModule.default ];
    taskwarrior = mkIf cfg.taskwarrior {
      age.secrets."taskwarrior.ca.cert.age" = {
        file = ../../secrets/taskwarrior.ca.cert.age;
        mode = "770";
        owner = "justin";
      };
      age.secrets."taskwarrior.public.certificate.age" = {
        file = ../../secrets/taskwarrior.public.certificate.age;
        mode = "770";
        owner = "justin";
      };
      age.secrets."taskwarrior.private.key.age" = {
        file = ../../secrets/taskwarrior.private.key.age;
        mode = "770";
        owner = "justin";
      };
    };
  };

}
