{
  lib,
  self,
  config,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (self.lib.validators) isModernShell;
in
{
  config = mkIf (isModernShell config && config.wave.programs.tui.enable) {
    programs.izrss = {
      enable = true;

      settings = {
        reader = {
          size = "full";
          theme = "environment";
        };

        urls = [
          "https://isabelroses.com/feed.xml"
          "https://robinroses.xyz/feed.xml"
          "https://uncenter.dev/feed.xml"
          "https://charm.sh/blog/rss.xml"
          "https://antfu.me/feed.xml"
          "https://fasterthanli.me/index.xml"
          "https://blog.orhun.dev/rss.xml"
          "https://mitchellh.com/feed.xml"
          "https://dataswamp.org/~solene/rss-html.xml"
          # "https://ayats.org/index.xml" seems to 404
          "https://nixpkgs.news/rss.xml"
          "https://maia.crimew.gay/feed.xml"
        ];
      };
    };
  };
}
