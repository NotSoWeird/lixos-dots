{
  lib,
  self,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkDefault;
  inherit (lib.attrsets) genAttrs;
  inherit (self.lib.validators) ifTheyExist;
in
{
  users.users = genAttrs config.wave.system.users (
    name:
    let
      hm = config.home-manager.users.${name};
    in
    {
      home = "/home/" + name;
      shell = hm.wave.programs.${hm.wave.programs.defaults.shell}.package;
    }
    // ({
      uid = mkDefault 1000;
      isNormalUser = true;
      initialPassword = mkDefault "changeme";

      # only add groups that exist
      extraGroups =
        [
          "wheel"
          "nix"
        ]
        ++ ifTheyExist config [
          "network"
          "networkmanager"
          "systemd-journal"
          "audio"
          "pipewire" # this give us access to the rt limits
          "video"
          "input"
          "plugdev"
          "lp"
          "tss"
          "power"
          "wireshark"
          "mysql"
          "docker"
          "podman"
          "git"
          "libvirtd"
          "cloudflared"
        ];
    })
  );
}
