{
  lib,
  self,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (self.lib.hardware) isx86Linux;
  inherit (config.wave) device;
  cfg = config.wave.system.sound;
in
{
  imports = [
    ./settings.nix
    # ./low-latency.nix
  ];

  config = mkIf (cfg.enable && device.hasSound) {
    # pipewire is newer and just better
    services.pipewire = {
      enable = true;

      audio.enable = true;
      pulse.enable = true;
      jack.enable = true;

      alsa = {
        enable = true;
        support32Bit = isx86Linux pkgs;
      };
    };

    systemd.user.services = {
      pipewire.wantedBy = [ "default.target" ];
      pipewire-pulse.wantedBy = [ "default.target" ];
    };
  };
}
