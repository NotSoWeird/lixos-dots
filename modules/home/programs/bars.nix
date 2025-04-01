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
    waybar = mkProgram pkgs "waybar" { };
  };
}
