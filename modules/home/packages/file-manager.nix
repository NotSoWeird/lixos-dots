{
  lib,
  self,
  pkgs,
  config,
  osConfig,
  ...
}:
let
  inherit (lib.attrsets) optionalAttrs mergeAttrsList;
  inherit (lib.modules) mkIf;
  inherit (self.lib.programs) mkProgram;

  cfg = config.wave.programs;
in
{
  options.wave.programs = {
    dolphin = mkProgram pkgs "dolphin" {
      package.default = pkgs.kdePackages.dolphin;
    };

    nemo = mkProgram pkgs "nemo" {
      package.default = pkgs.nemo-with-extensions;
    };

    thunar = mkProgram pkgs "thunar" { };
  };

  config = mkIf (cfg.gui.enable && osConfig.wave.meta.isWM) {
    wave.packages = mergeAttrsList [
      (optionalAttrs cfg.nemo.enable {
        inherit (cfg.nemo) package;
        inherit (pkgs) nemo-fileroller nemo-emblems;
      })

      (optionalAttrs cfg.dolphin.enable { inherit (cfg.dolphin) package; })
    ];

    xfconf.settings = mkIf cfg.thunar.enable {
      thunar = {
        "default-view" = "ThunarDetailsView";
        "misc-middle-click-in-tab" = true;
        "misc-open-new-window-as-tab" = true;
        "misc-single-click" = false;
        "misc-volume-management" = false;
      };
    };
  };
}
