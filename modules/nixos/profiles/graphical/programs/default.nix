{
  imports = [
    ./ccache.nix # ccache lets us get more cache hits :D
    ./cli.nix # misc cli applications
    ./gui.nix # misc gui applications
    ./thunar.nix # thunar the only file manager i have to configure at the system level
    ./wine.nix # wine the emulator

    ./niri.nix # niri specific environment configuration
  ];
}
