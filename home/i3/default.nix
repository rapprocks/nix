{ pkgs, ... }: {
  imports = [
    ./i3wm.nix
  ];
  environment.systemPackages = with pkgs; [
    xorg.xrandr
    xorg.xdpyinfo
    xorg.xmodmap
  ];
}
