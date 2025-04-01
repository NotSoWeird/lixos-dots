{
  self,
  pkgs,
  ...
}:
let
  inherit (self.lib.programs) mkProgram;
in
{
  options.wave.programs = {
    rofi = mkProgram pkgs "rofi" {
      package.default =
        let
          pkg = pkgs.rofi-wayland;
        in
        pkg.override { plugins = [ pkgs.rofi-rbw ]; };
    };
  };
}
