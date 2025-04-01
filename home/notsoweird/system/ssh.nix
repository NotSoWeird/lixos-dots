{
  programs.ssh = {
    enable = true;
    hashKnownHosts = true;
    compression = true;

    matchBlocks = {
      # git clients
      "aur.archlinux.org" = {
        user = "aur";
        hostname = "aur.archlinux.org";
      };

      "github.com" = {
        user = "git";
        hostname = "github.com";
      };

      "gitlab.com" = {
        user = "git";
        hostname = "gitlab.com";
      };

      "git.auxolotl.org" = {
        user = "forgejo";
        hostname = "git.auxolotl.org";
      };
    };
  };
}
