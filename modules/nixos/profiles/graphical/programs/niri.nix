{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf;

  inherit (config.wave) meta;
in
{
  config = mkIf meta.niri {
    services.displayManager.sessionPackages = [ pkgs.niri ];
  };
}
