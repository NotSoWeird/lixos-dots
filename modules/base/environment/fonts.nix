{
  pkgs,
  config,
  ...
}:
{
  fonts =
    {
      packages = builtins.attrValues {
        inherit (config.wave.style.font) package;

        inherit (pkgs)
          corefonts

          source-sans
          source-serif

          dejavu_fonts
          inter

          noto-fonts

          # fonts for none latin languages
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif

          # install some emoji fonts
          noto-fonts-color-emoji
          material-icons
          material-design-icons
          ;

        inherit (pkgs.nerd-fonts) symbols-only;
      };
    }
    // {
      # if we are on linux we should create a fontconfig file
      fontconfig = {
        enable = true;
        hinting.enable = true;
        antialias = true;

        # create all the fonts and set the fallback to the symbols nerd font
        defaultFonts =
          let
            fnts = [
              config.wave.style.font.name
              "Symbols Nerd Font"
              # fallbacks
              "Noto Sans Symbols"
              "Noto Sans Symbols2"
            ];
          in
          {
            monospace = fnts;
            sansSerif = fnts;
            serif = fnts;
            emoji = [
              "Noto Color Emoji"
              "Symbols Nerd Font"
            ];
          };
      };

      # this can allow us to save some storage space
      fontDir.decompressFonts = true;
    };
}
