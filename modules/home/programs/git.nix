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
    git = mkProgram pkgs "git" {
      enable.default = config.wave.programs.cli.enable;

      package.default = pkgs.gitMinimal;
    };
  };
}
