{ config, pkgs, ... }:

{

  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    icons = true;
  };

}
