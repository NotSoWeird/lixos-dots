{ lib, config, ... }:
let
  inherit (lib.modules) mkIf mkForce;
  cfg = config.wave.system.boot;
in
{
  config = mkIf (cfg.loader == "none") {
    boot.loader = {
      grub.enable = mkForce false;
      systemd-boot.enable = mkForce false;
    };
  };
}
