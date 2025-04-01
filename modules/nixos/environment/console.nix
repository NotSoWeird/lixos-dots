{ lib, pkgs, ... }:
{
  console = {
    enable = lib.modules.mkDefault true;
    earlySetup = true;

    keyMap = "se";
    font = "${pkgs.terminus_font}/share/consolefonts/ter-d18n.psf.gz";
  };
}
