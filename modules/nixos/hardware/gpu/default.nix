{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  imports = [
    ./amd.nix
    ./intel.nix
    ./nvidia.nix
  ];

  options.wave.device.gpu = mkOption {
    type = types.nullOr (
      types.enum [
        "amd"
        "intel"
        "nvidia"
        "hybrid-nv"
      ]
    );
    default = null;
    description = "The manufacturer of the primary system gpu";
  };
}
