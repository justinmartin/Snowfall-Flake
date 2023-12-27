{ lib, config, ... }:
with lib;
with lib.frgd;
let cfg = config.frgd.tools.ssh;
in {
  options.frgd.tools.ssh = { enable = mkEnableOption "SSH"; };

  config = mkIf cfg.enable {
    programs.ssh = {
      extraConfig = ''
        Host *
          HostKeyAlgorithms +ssh-rsa
      '';
    };
  };
}
