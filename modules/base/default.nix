{
  imports = [
    ./activation # activation system for nixos-rebuild
    ./environment # basic system environment configuration i.e. shell aliases and environment variables
    ./nix # all nix related configurations
    ./options # options that occur on all systems
    ./users # users of the machine

    ./programs.nix # programs that are installed system-wide no matter the device
    ./themes.nix # themes for the system
  ];
}
