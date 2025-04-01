{
  lib,
  pkgs,
  self,
  self',
  config,
  osConfig,
  ...
}:
let
  inherit (lib.attrsets) optionalAttrs mergeAttrsList;
  inherit (self.lib.validators) hasProfile isWayland isModernShell;

  hasSound = (osConfig.wave.system ? sound) && osConfig.wave.system.sound.enable;

  cfg = config.wave.programs;
in
{
  wave.packages = mergeAttrsList [
    (optionalAttrs (hasProfile osConfig [ "graphical" ] && cfg.cli.enable && cfg.gui.enable) {
      inherit (pkgs)
        libnotify # needed for some notifications
        brightnessctl # brightness managed via cli
        ;
    })

    (optionalAttrs cfg.cli.enable {
      inherit (pkgs)
        unzip
        rsync
        just # cool build tool
        nix-output-monitor # much nicer nix build output
        ;

      inherit (self'.packages) scripts;
    })

    (optionalAttrs (isModernShell config) {
      inherit (pkgs)
        jq # json parser
        yq # yaml parser
        ;
    })

    (optionalAttrs (isWayland osConfig && cfg.cli.enable && cfg.gui.enable) {
      inherit (pkgs)
        grim
        slurp
        wl-clipboard
        cliphist
        ;
    })

    # if the sound option exists then continue the to check if sound.enable is true
    (optionalAttrs (cfg.gui.enable && hasSound) {
      inherit (pkgs) pwvucontrol;
    })

    (optionalAttrs (hasProfile osConfig [ "graphical" ] && isWayland osConfig) {
      inherit (pkgs)
        wl-gammactl
        ;
    })
  ];
}
