{ pkgs, config, ... }:
{
  # home-manager is so strange and needs these declared multiple times
  programs = {
    fish.enable = config.wave.meta.fish;
    zsh.enable = config.wave.meta.zsh;
  };

  wave.packages = {
    # GNU core utilities (rewritten in rust)
    inherit (pkgs) uutils-coreutils-noprefix;
  };
}
