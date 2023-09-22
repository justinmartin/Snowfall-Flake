{ lib, pkgs, config, ... }:

with lib;
with lib.frgd;
let
  cfg = config.frgd.cli-apps.prisma;
in
{
  options.frgd.cli-apps.prisma = with types; {
    enable = mkBoolOpt false "Whether or not to install Prisma";
    pkgs = {
      npm = mkOpt package pkgs.nodePackages.prisma "The NPM package to install";
      engines = mkOpt package pkgs.prisma-engines
        "The package to get prisma engines from";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.pkgs.npm ];

    frgd.home.extraOptions = {
      programs.zsh.initExtra = ''
        export PRISMA_MIGRATION_ENGINE_BINARY="${cfg.pkgs.engines}/bin/migration-engine"
        export PRISMA_QUERY_ENGINE_BINARY="${cfg.pkgs.engines}/bin/query-engine"
        export PRISMA_QUERY_ENGINE_LIBRARY="${cfg.pkgs.engines}/lib/libquery_engine.node"
        export PRISMA_INTROSPECTION_ENGINE_BINARY="${cfg.pkgs.engines}/bin/introspection-engine"
        export PRISMA_FMT_BINARY="${cfg.pkgs.engines}/bin/prisma-fmt"
      '';
    };
  };
}
