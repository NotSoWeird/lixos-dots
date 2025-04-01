{
  programs.niri.settings = {
    layout = {
      gaps = 8;

      # center-focused-column = "never";
      always-center-single-column = true;

      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
        { proportion = 1.0; }
      ];

      default-column-widths = [
        { proportion = 1.0 / 2.0; }
      ];

      focus-ring = {
        width = 2;

        active.gradient = {
          from = "#b20056";
          to = "#8c00ea";
          angle = 37;
          in' = "oklch shorter hue";
          relative-to = "workspace-view";
        };
      };

    };
  };
}
