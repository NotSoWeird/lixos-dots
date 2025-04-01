{
  lib,
  self,
  config,
  ...
}:
{
  # remove stupid sites that i just don't want to see
  config = {
    networking.stevenblack = {
      enable = true;
      block = [
        "fakenews"
        "gambling"
      ];
    };
  };
}
