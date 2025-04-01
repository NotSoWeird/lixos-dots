{
  lib,
  ...
}:
let
  inherit (lib.options) mkOption;
  inherit (lib.types) enum nullOr;
in
{
  options.wave.programs.defaults = {
    shell = mkOption {
      type = enum [
        "bash"
        "zsh"
        "fish"
        "nushell"
      ];
      default = "fish";
    };

    terminal = mkOption {
      type = enum [
        "kitty"
        "wezterm"
      ];
      default = "wezterm";
    };

    fileManager = mkOption {
      type = enum [
        "thunar"
        "dolphin"
      ];
      default = "dolphin";
    };

    browser = mkOption {
      type = enum [
        "zen-browser"
      ];
      default = "zen-browser";
    };

    editor = mkOption {
      type = enum [
        "helix"
      ];
      default = "helix";
    };

    launcher = mkOption {
      type = nullOr (enum [
        "rofi"
      ]);
      default = "rofi";
    };

    bar = mkOption {
      type = nullOr (enum [
        "waybar"
      ]);
      default = "waybar";
    };

    screenLocker = mkOption {
      type = nullOr (enum [
        "gtklock"
      ]);
      default = "gtklock";
      description = ''
        The lockscreen module to be loaded by home-manager.
      '';
    };
  };
}
