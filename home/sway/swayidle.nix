{ pkgs, config, ... }:

{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 295; #295
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
      }
      {
        timeout = 300; #300
        command = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --clock --effect-blur 7x5";
      }
      {
        timeout = 360; #360
        command = "swaymsg 'output * dpms off'";
        resumeCommand = "swaymsg 'output * dpms on'";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --clock --effect-blur 7x5";
      }
    ];
  };
}
