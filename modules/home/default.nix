{
  imports = [
    ./environment # environment variables & path
    ./packages
    ./programs
    ./desktop.nix # desktop environment
    ./docs.nix # no more docs
    ./home.nix # home settings
    ./packages.nix # packages to install
  ];
}
