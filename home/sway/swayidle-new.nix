{ pkgs, config, ... }:
let lockTime = 4 * 60;
in
{
  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    timeouts = [
      {
        timeout = 55;
        command = "${config.programs.swaylock.package}/bin/swaylock";
      }
      {
        timeout = 60;
        command = "${swaymsg} 'output * dpms off'";
        resumeCommand = "${swaymsg} 'output * dpms on'";
      }
    ];
  };
}
