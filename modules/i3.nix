{pkgs, ...}:
{
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
        defaultSession = "none+i3";
        lightdm.enable = false;
        gdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
    };
  };
}
