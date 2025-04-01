{
  lib,
  pkgs,
  self,
  config,
  ...
}:
let
  inherit (lib.options) mkEnableOption;

  cfg = config.wave.system.tools;
in
{
  options.wave.system.tools = {
    enable = mkEnableOption "tools" // {
      default = true;
    };

    minimal = mkEnableOption "limit to minimal system tooling" // {
      default = true;
    };
  };

  config.system = {
        disableInstallerTools = cfg.minimal;

        rebuild.enableNg = true;

        tools = {
          nixos-version.enable = true;
          nixos-rebuild.enable = false;
        };
      };
}
