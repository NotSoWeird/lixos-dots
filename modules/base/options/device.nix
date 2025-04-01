{ lib, ... }:
let
  inherit (lib.options) mkOption;
  inherit (lib.types) enum listOf;
in
{
  options.wave.device.profiles = mkOption {
    type = listOf (enum [
      # physical
      "laptop"
      "desktop"

      # meta
      "lite"
      "graphical"
      "headless"
    ]);
    default = [ ];
  };
}
