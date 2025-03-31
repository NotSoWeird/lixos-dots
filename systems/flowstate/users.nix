_: {
  wave.system = {
    mainUser = "notsoweird";
    users = [ "notsoweird" ];
  };

  home-manager.users.notsoweird.wave = {
    environment = {
      desktop = "Hyprland";
    };


    programs = {
      waybar.enable = true;
      rofi.enable = true;
      fish.enable = true;

      cli = {
        enable = true;
        modernShell.enable = true;
      };

      tui.enable = true;
      gui.enable = true;

      discord.enable = true;
      kitty.enable = true;
      zathura.enable = true;
      firefox.enable = true;
    };
  };
}
