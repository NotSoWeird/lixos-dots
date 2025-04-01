{
  lib,
  config,
  ...
}:
let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
in
{
  config = mkIf (elem "notsoweird" config.wave.system.users) {
    # users.users.isabel.openssh.authorizedKeys.keys = [
    #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMQDiHbMSinj8twL9cTgPOfI6OMexrTZyHX27T8gnMj2"
    # ];
  };
}
