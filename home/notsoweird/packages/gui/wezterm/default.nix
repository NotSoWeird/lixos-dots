{
  lib,
  config,
  ...
}:
let
  cfg = config.wave.programs.wezterm;
in
{
  config = lib.modules.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."wezterm" = {
      source = ./.;
      recursive = true;
    };
  };
}
