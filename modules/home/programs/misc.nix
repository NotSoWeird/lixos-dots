{
  lib,
  self,
  pkgs,
  config,
  ...
}:
let
  inherit (self.lib.programs) mkProgram;
in
{
  options.wave.programs = {
    zathura = mkProgram pkgs "zathura" { };

    discord = mkProgram pkgs "discord" {
      package.default = pkgs.discord.override {
        withOpenASAR = true;
        withVencord = true;
      };
    };

    cocogitto = mkProgram pkgs "cocogitto" {
      enable.default = config.wave.programs.cli.enable;
    };
  };
}
