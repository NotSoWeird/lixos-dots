{
  lib,
  self,
  config,
  ...
}:
let
  inherit (lib.trivial) id;
  inherit (lib.options) mkOption;
  inherit (self.lib.validators) anyHome;
  inherit (lib.strings) concatStringsSep;

  mkMetaOption =
    path:
    mkOption {
      default = anyHome config id path;
      example = true;
      description = "Does ${concatStringsSep "." path} meet the requirements";
      type = lib.types.bool;
    };
in
{
  options.wave.meta = {
    zsh = mkMetaOption [
      "wave"
      "programs"
      "zsh"
      "enable"
    ];
    fish = mkMetaOption [
      "wave"
      "programs"
      "fish"
      "enable"
    ];
    thunar = mkMetaOption [
      "wave"
      "programs"
      "thunar"
      "enable"
    ];
    gui = mkMetaOption [
      "wave"
      "programs"
      "gui"
      "enable"
    ];

    isWayland = mkMetaOption [
      "wave"
      "meta"
      "isWayland"
    ];
    isWM = mkMetaOption [
      "wave"
      "meta"
      "isWM"
    ];

    niri =
      let
        path = [
          "wave"
          "environment"
          "desktop"
        ];
      in
      mkOption {
        default = anyHome config (v: v == "Niri") path;
        example = true;
        description = "Does ${concatStringsSep "." path} meet the requirements";
        type = lib.types.bool;
      };
  };
}
