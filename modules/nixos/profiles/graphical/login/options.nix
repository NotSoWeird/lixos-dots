{
  lib,
  self,
  config,
  ...
}:
let
  inherit (lib.options) mkOption;
  inherit (lib.modules) mkOptionDefault;
  inherit (lib.types) nullOr enum;
  inherit (self.lib.validators) hasProfile;
in
{
  options.wave.environment.loginManager = mkOption {
    type = nullOr (enum [
      "greetd"
    ]);
    description = "The login manager to be used by the system.";
  };

  config = {
    wave.environment.loginManager = mkOptionDefault (
      if (hasProfile config [ "graphical" ]) then "greetd" else null
    );
  };
}
