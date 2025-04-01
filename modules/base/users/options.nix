{ lib, config, ... }:
let
  inherit (lib.options) mkOption;
  inherit (lib.lists) optionals;
  inherit (lib.types) enum listOf str;
in
{
  options.wave.system = {
    mainUser = mkOption {
      type = enum config.wave.system.users;
      description = "The username of the main user for your system";
      default = builtins.elemAt config.wave.system.users 0;
    };

    users = mkOption {
      type = listOf str;
      default = [ "notsoweird" ];
      description = ''
        A list of users that you wish to declare as your non-system users. The first username
        in the list will be treated as your main user unless {option}`wave.system.mainUser` is set.
      '';
    };
  };

  config.warnings = optionals (config.wave.system.users == [ ]) [
    ''
      You have not added any users to be supported by your system. You may end up with an unbootable system!

      Consider setting {option}`config.wave.system.users` in your configuration
    ''
  ];
}
