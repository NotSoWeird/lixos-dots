{
  self,
  config,
  inputs',
  ...
}:
{
  programs.nh = {
    enable = true;

    clean = {
      enable = false;
      dates = "weekly";
    };
  };
}
