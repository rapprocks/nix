{pkgs, ...}: {
  services.kanshi = {
    enable = true;

    profiles = {
      
      singel-monitor = {
        outputs = [
          {
            criteria = "LG Electronics LG ULTRAGEAR+ 207NTWG13713";
            mode = "2560x1440@143.973007Hz";
            status = "enable";
          }
        ];
      };

      dual-monitor = {
        outputs = [
          {
            criteria = "LG Electronics LG ULTRAGEAR+ 207NTWG13713";
            mode = "2560x1440@143.973007Hz";
            position = "2560,1510";
          }
          {
            criteria = "HP Inc. HP Z27n G2 6CM83607Z4";
            mode = "2560x1440@74.971001Hz";
            position = "1120,1240";
            transform = "270";
          }
        ];
      };

    };
  };
}
