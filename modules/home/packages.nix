{ lib, config, ... }:
let
  inherit (lib.options) mkOption;
  inherit (lib.types) attrsOf package;
in
{
  options.wave.packages = mkOption {
    type = attrsOf package;
    default = { };
    description = ''
      A set of packages to install in the wave environment.
    '';
  };

  config = {
    home.packages = builtins.attrValues config.wave.packages;
  };
}
