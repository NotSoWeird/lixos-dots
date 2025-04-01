{ pkgs, ... }:
{
  # packages that should be on all deviecs
  wave.packages = {
    inherit (pkgs)
      git
      curl
      wget
      pciutils
      lshw
      ;
  };
}
