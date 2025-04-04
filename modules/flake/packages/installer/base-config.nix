{
  wave = {
    device = {
      type = "laptop";
      cpu = "intel";
      monitors = [ "eDP-1" ];
      hasTPM = true;
      hasBluetooth = true;
      hasSound = true;
    };

    system = {
      boot = {
        loader = "systemd-boot";
        secureBoot = false;
        tmpOnTmpfs = false;
        loadRecommendedModules = true;
        enableKernelTweaks = true;
        initrd.enableTweaks = true;
      };

      fs = {
        enableDefaults = true;
        enableSwap = true;
        support = [
          "btrfs"
          "vfat"
        ];
      };

      video.enable = true;
      sound.enable = true;
      bluetooth.enable = false;
      printing.enable = false;

      security = {
        fixWebcam = false;
        auditd.enable = true;
      };

      networking = {
        optimizeTcp = true;
        wirelessBackend = "iwd";
      };
    };
  };

  home-manager.users.notsoweird = {
    environment = {
      desktop = "Niri";
    };

    programs = {
      cli = {
        enable = true;
        modernShell.enable = true;
      };
      tui.enable = true;
      gui.enable = true;
    };
  };
}
