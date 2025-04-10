{
  lib,
  self,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.meta) getExe;
  inherit (lib.modules) mkIf;
  inherit (self.lib.validators) hasProfile isWayland;
in
{
  config = mkIf ((hasProfile config [ "graphical" ]) && (isWayland config)) {
    systemd.services.seatd = {
      enable = true;
      description = "Seat management daemon";
      script = "${getExe pkgs.seatd} -g wheel";
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = "1";
      };
      wantedBy = [ "multi-user.target" ];
    };
  };
}
