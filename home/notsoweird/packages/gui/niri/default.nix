{
  lib,
  pkgs,
  config,
  niri,
  ...
}:
let
  env = config.wave.environment;
in
{
  imports = [ ./config ];

  config = lib.modules.mkIf (env.desktop == "Niri") {
    wave.packages = {
      inherit (pkgs)
        swww
        wl-clipboard
        wayland-utils
        swaylock
        ;
    };

    programs.niri.enable = true;
    nixpkgs.overlays = [ niri.overlays.niri ];
  };
}
