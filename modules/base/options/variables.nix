{
  lib,
  self,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.options) mkOption;
  inherit (lib.types) str;

  sys = config.wave.system;
  env = config.wave.environment;
in
{
  options.wave.environment.flakePath = mkOption {
    type = str;
    default = "/home/${sys.mainUser}/.config/flake";
    description = "The path to the configuration";
  };

  config.assertions = [
    {
      assertion = sys.useHomeManager -> sys.mainUser != null;
      message = "system.mainUser must be set while useHomeManager is enabled";
    }
    {
      assertion = env.flakePath != null -> sys.mainUser != null;
      message = "system.mainUser must be set if a flakePath is specified";
    }
  ];
}
