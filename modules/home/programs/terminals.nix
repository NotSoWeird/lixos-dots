{
  self,
  pkgs,
  config,
  inputs',
  ...
}:
let
  inherit (self.lib.programs) mkProgram;
in
{
  options.wave.programs = {
    wezterm = mkProgram pkgs "wezterm" {
      enable.default = config.wave.programs.gui.enable;
      package.default = inputs'.tgirlpkgs.packages.wezterm;
    };

    kitty = mkProgram pkgs "kitty" { };
  };
}
