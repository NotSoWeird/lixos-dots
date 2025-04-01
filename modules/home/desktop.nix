{
  lib,
  self,
  config,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkOptionDefault;
  inherit (lib.attrsets) getAttrFromPath;
  inherit (lib.lists) elem;
  inherit (lib.options) mkOption;
  inherit (lib.types) nullOr enum;
  inherit (self.lib.validators) hasProfile;

  mkMetaOption =
    path: enum:
    mkOption {
      default = elem (getAttrFromPath path config) enum;
      example = true;
      description = "Does ${enum} contain ${getAttrFromPath path}.";
      type = lib.types.bool;
    };
in
{
  options.wave = {
    environment.desktop = mkOption {
      type = nullOr (enum [
        "Niri"
      ]);
      description = "The desktop environment to be used.";
    };

    meta = {
      isWayland = mkMetaOption [ "wave" "environment" "desktop" ] [ "Niri" ];
    };
  };

  config.wave = {
    environment = {
      desktop = mkOptionDefault (if (hasProfile osConfig [ "graphical" ]) then null else "Niri");
    };
  };
}
