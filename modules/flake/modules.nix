{ self, ... }:
let
  inherit (builtins) throw;

  mkModule =
    {
      name ? "wave",
      class,
      modules,
    }:
    {
      _class = class;
      _file = "${self.outPath}/flake.nix#${class}Modules.${name}";

      imports = modules;
    };
in
{
  flake = {
    nixosModules = {
      wave = mkModule {
        class = "nixos";
        modules = [
          (self + /modules/base/default.nix)
          (self + /modules/nixos/default.nix)
        ];
      };

      # i do not provide a default module, so throw an error
      default = throw "There is no default module.";
    };

    homeManagerModules = {
      wave = mkModule {
        class = "homeManager";
        modules = [ (self + /modules/home/default.nix) ];
      };

      hyfetch = mkModule {
        name = "gtklock";
        class = "homeManager";
        modules = [ (self + /modules/extra/home-manager/hyfetch.nix) ];
      };

      default = throw "There is no default module.";
    };
  };
}
