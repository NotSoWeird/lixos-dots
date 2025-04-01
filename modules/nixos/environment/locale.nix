{ lib, ... }:
{
  time = {
    timeZone = "Europe/Stockholm";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "sv_SE.utf8";

    supportedLocales = lib.modules.mkDefault [
      "sv_SE.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
    ];
  };
}
