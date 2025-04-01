{
  config,
  osConfig,
  ...
}:
let
  inherit (config.wave.programs) defaults;
in
{
  home.sessionVariables = {
    EDITOR = defaults.editor;
    GIT_EDITOR = defaults.editor;
    VISUAL = defaults.editor;
    TERMINAL = defaults.terminal;
    SYSTEMD_PAGERSECURE = "true";
    PAGER = defaults.pager;
    MANPAGER = defaults.manpager;
    FLAKE = osConfig.wave.environment.flakePath;
    NH_FLAKE = osConfig.wave.environment.flakePath;
    DO_NOT_TRACK = 1;
  };

  programs.nushell.environmentVariables = config.home.sessionVariables;
}
