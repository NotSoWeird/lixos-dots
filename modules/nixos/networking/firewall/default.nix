{
  lib,
  pkgs,
  self,
  config,
  ...
}:
let
  inherit (lib.modules) mkForce;
in
{
  imports = [ ./fail2ban.nix ];

  config = {
    networking.firewall = {
      enable = true;
      package = pkgs.iptables;

      allowedTCPPorts = [
        443
        8080
      ];
      allowedUDPPorts = [ ];

      # Don't allow our client to be pinged.
      allowPing = false;

      # make a much smaller and easier to read log
      logReversePathDrops = true;
      logRefusedConnections = false;

      # Don't filter DHCP packets, according to nixops-libvirtd
      checkReversePath = mkForce false;
    };
  };
}
