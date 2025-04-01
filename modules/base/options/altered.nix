{ lib, ... }:
let
  inherit (lib.modules) mkRemovedOptionModule;
in
{
  imports = [
    (mkRemovedOptionModule [
      "wave"
      "services"
    ] "Unused")
  ];
}
