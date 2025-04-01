{
  lib,
  self,
  pkgs,
  ...
}:
let
  inherit (self.lib.programs) mkProgram;
in
{
  options.wave.programs = {
    helix = mkProgram pkgs "helix" { };
  };
}
