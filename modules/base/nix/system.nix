{
  lib,
  self,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.options) mkOption;
  inherit (lib.modules) mkDefault;
  inherit (self.lib.hardware) ldTernary;

  cfg = config.wave.system;
in
{
  options.wave.system.stateVersion = mkOption {
    type = lib.types.str;
    default = "25.05";
  };

  config.system = {
    # this is the NixOS version that the configuration was generated with
    # this should be change to the version of the NixOS release that the configuration was generated with
    # https://nixos.org/manual/nixos/unstable/release-notes.html
    stateVersion = mkDefault (ldTernary pkgs cfg.stateVersion 6);

    # we can get the git rev that we are working on and set that to the configurationRevision
    # this *might* be useful for debugging
    configurationRevision = self.shortRev or self.dirtyShortRev or "dirty";
  };
}
