{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.options) mkEnableOption;
in
{
  options.wave.system.activation.diff.enable = mkEnableOption "Enable a system diff" // {
    default = !config.programs.nh.enable;
  };

  # if the system supports dry activation, this means that we can compare
  # the current system with the one we are about to switch to
  # this can be useful to see what will change, and the clousure size
  config = mkIf config.wave.system.activation.diff.enable (mkMerge [
    {
      system.activationScripts.diff = {
        text = ''
          if [[ -e /run/current-system ]]; then
            echo "=== diff to current-system ==="
            ${pkgs.nvd}/bin/nvd --nix-bin-dir='${config.nix.package}/bin' diff /run/current-system "$systemConfig"
            echo "=== end of the system diff ==="
          fi
        '';
      };
    }

    (mkIf pkgs.stdenv.hostPlatform.isLinux {
      system.activationScripts.diff.supportsDryActivation = true;
    })
  ]);
}
