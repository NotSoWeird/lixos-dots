{
  self,
  pkgs,
  ...
}:
let
  inherit (self.lib.programs) mkProgram;
in
{
  options.garden.programs = {
    waybar = mkProgram pkgs "waybar" { };
  };
}
