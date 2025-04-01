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
    fuzzel = mkProgram pkgs "fuzzel" { };
  };
}
