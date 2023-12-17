{ pkgs, ... }: {
  imports = [
    ./i3.nix
  ];
  environment.systemPackages = with pkgs; [
    xorg.xrandr
    xorg.xdpyinfo
    xorg.xmodmap
  ];
}
