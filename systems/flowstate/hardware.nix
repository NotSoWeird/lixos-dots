{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/fb2c67b5-c94d-439b-9430-2201a90ad985";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/5200-FF22";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

  };
}
