_: {
  wave.system = {
    mainUser = "notsoweird";
    users = [ "notsoweird" ];
  };

  home-manager.users.notsoweird.wave = {
    environment = {
      desktop = "Niri";
      shell = "fish";
      browser = "zen-browser";
      terminal = "kitty";
    };

    programs = {
      cli = {
        enable = true;
        modernShell.enable = true;
      };

      tui.enable = true;
      gui.enable = true;

      zathura.enable = true;
    };
  };
}
