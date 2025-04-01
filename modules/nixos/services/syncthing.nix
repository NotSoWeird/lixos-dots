{
  lib,
  self,
  config,
  ...
}:
let

  inherit (lib.modules) mkIf;
  inherit (self.lib.services) mkServiceOption;

  cfg = config.wave.services.syncthing;
in
{
  options.wave.services.syncthing = mkServiceOption "syncthing" { };

  # I don't really want to expose the GUI for this one, try ssh instead
  # > ssh <hostname> -L 18384:localhost:8384
  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;

      dataDir = "/srv/storage/syncthing";
    };
  };
}
