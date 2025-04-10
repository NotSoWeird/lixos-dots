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
    bash = mkProgram pkgs "bash" {
      enable.default = true;
      package.default = pkgs.bashInteractive;
    };

    zsh = mkProgram pkgs "zsh" { };

    fish = mkProgram pkgs "fish" { };

    nushell = mkProgram pkgs "nushell" { };
  };
}
