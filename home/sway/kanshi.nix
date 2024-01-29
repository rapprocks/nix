{pkgs, ...}: {
  services.kanshi = {
    enable = true;
    systemdTarget = "sway-session.target";

    profiles = {
      
      singel-monitor = {
        outputs = [
          {
            criteria = "LG Electronics LG ULTRAGEAR+ 207NTWG13713";
            mode = "1920x1080@143.981Hz";
            status = "enable";
          }
        ];
      };

      dual-monitor = {
        outputs = [
          {
            criteria = "LG Electronics LG ULTRAGEAR+ 207NTWG13713";
            mode = "3840x2160@143.981Hz";
            scale = "2";
            position = "2560,1510";
          }
          {
            criteria = "HP Inc. HP Z27n G2 6CM83607Z4";
            mode = "2560x1440@74.971001Hz";
            position = "1120,350";
            transform = "270";
          }
        ];
      };

    };
  };
}
