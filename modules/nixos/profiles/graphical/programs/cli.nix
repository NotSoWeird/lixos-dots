{
  lib,
  self,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (self.lib.validators) hasProfile;
in
{
  config = mkIf (hasProfile config [ "graphical" ]) {
    programs = {
      # show network usage
      bandwhich.enable = true;
    };
  };
}
