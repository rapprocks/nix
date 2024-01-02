{ pkgs, config, ... }:
let
  lockTime = 10 * 60;
  swaymsg = "${config.wayland.windowManager.sway.package}/bin/swaymsg";
in
{
  services.swayidle = {
    enable = true;
    systemdTarget = "sway-session.target";
    timeouts = [
      {
        timeout = lockTime;
        command = "${pkgs.swaylock-effects}/bin/swaylock -e --image $HOME/dotfiles/wallpapers/nixos-dark-2.wp.png"; 
      }
      {
        timeout = lockTime * 2;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock-effects}/bin/swaylock -e --image $HOME/dotfiles/wallpapers/nixos-dark-2.wp.png"; }
    ];
  };
}
