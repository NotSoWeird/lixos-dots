{
  self,
  pkgs,
  inputs',
  ...
}:
let
  inherit (self.lib.programs) mkProgram;
in
{
  options.wave.programs = {
    chromium = mkProgram pkgs "chromium" {
      package.default = inputs'.tgirlpkgs.packages.thorium;
    };

    firefox = mkProgram pkgs "firefox" {
      package.default = pkgs.firefox.override {
        speechSynthesisSupport = false;
      };
    };
  };
}
