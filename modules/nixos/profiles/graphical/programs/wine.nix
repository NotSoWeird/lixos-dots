{
  lib,
  self,
  pkgs,
  config,
  ...
}:
let
  inherit (self.lib.programs) mkProgram;
  inherit (self.lib.validators) isWayland;
  inherit (lib.lists) optional;

  cfg = config.wave.programs.wine;
in
{
  options.wave.programs.wine = mkProgram pkgs "wine" {
    package.default =
      if isWayland config then pkgs.wineWowPackages.waylandFull else pkgs.wineWowPackages.stableFull;
  };

  # determine which version of wine to use
  config.environment.systemPackages = optional cfg.enable cfg.package;
}
