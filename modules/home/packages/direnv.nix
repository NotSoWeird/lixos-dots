{
  lib,
  pkgs,
  self,
  config,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (self.lib.validators) hasProfile isModernShell;

  acceptedTypes = [
    "desktop"
    "laptop"
    "hybrid"
  ];
in
{
  programs.direnv = mkIf (hasProfile osConfig acceptedTypes && isModernShell config) {
    enable = true;
    silent = true;

    # faster, persistent implementation of use_nix and use_flake
    nix-direnv.enable = true;

    # modified from from @i077
    # store direnv in cache and not per project
    stdlib = ''
      : ''${XDG_CACHE_HOME:=$HOME/.cache}
      declare -A direnv_layout_dirs

      direnv_layout_dir() {
        echo "''${direnv_layout_dirs[$PWD]:=$(
          echo -n "$XDG_CACHE_HOME"/direnv/layouts/
          echo -n "$PWD" | ${pkgs.perl}/bin/shasum | cut -d ' ' -f 1
        )}"
      }
    '';
  };
}
