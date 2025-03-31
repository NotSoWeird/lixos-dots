{
  imports = [
    ./hardware.nix
    ./users.nix
  ];

  wave = {
    device = {
      profiles = [
        "laptop"
        "graphical"
      ];
      cpu = "intel";
      gpu = null;
      monitors = [ "eDP-1" ];
      hasTPM = true;
      hasBluetooth = true;
      hasSound = true;
      keyboard = "se";
    };

    system = {
      boot = {
        loader = "systemd-boot";
        # secureBoot = false;
        tmpOnTmpfs = false;
        loadRecommendedModules = true;
        enableKernelTweaks = true;
        initrd.enableTweaks = true;
        plymouth.enable = false;
      };

      fs = {
        enableSwap = true;
        support = [
          "ext4"
          "btrfs"
          "vfat"
        ];
      };

      video.enable = true;
      sound.enable = true;
      bluetooth.enable = true;
      printing.enable = true;

      security = {
        fixWebcam = false;
        auditd.enable = true;
      };

      networking = {
        optimizeTcp = true;

        wirelessBackend = "iwd";
      };

      virtualization = {
        enable = true;
        docker.enable = false;
        qemu.enable = true;
        podman.enable = false;
        distrobox.enable = true;
      };
    };

    style.font.name = "Maple Mono NF";
  };
}
