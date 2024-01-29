{ pkgs, config, lib, ... }: {
  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";

    events = [

      {
        event = "before-sleep";
        command = "swaymsg 'output * power off'";
      }
      {
        event = "before-sleep";
        command =
          "${pkgs.swaylock-effects}/bin/swaylock --screenshot --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color 966C59 --key-hl-color D08770 --line-color 00000000 --inside-color 4C3A32CC --separator-color 2E1E18 --grace 2 --fade-in 0.2";
      }
      {
        event = "lock";
        command =
          "${pkgs.swaylock-effects}/bin/swaylock --screenshot --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color 966C59 --key-hl-color D08770 --line-color 00000000 --inside-color 4C3A32CC --separator-color 2E1E18 --grace 2 --fade-in 0.2";
      }
      {
        event = "after-resume";
        command = "swaymsg 'output * power on'";
      }
    ];
    timeouts = [
     {
        timeout = 600;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
