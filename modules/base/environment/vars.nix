{ config, ... }:
{
  # variables that I want to set globally on all systems
  environment.variables = {
    SYSTEMD_PAGERSECURE = "true";

    # Some programs like `nh` use the FLAKE env var to determine the flake path
    FLAKE = config.wave.environment.flakePath;
    NH_FLAKE = config.wave.environment.flakePath;
  };
}
