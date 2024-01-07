{lib, ...}: {
  programs.thunderbird = {
    enable = true;

    profiles.default = {
      isDefault = true;
    };
  };

  accounts.email.accounts =
    lib.mapAttrs (
      name: config:
      {
        realName = "Philip Rapp";
        userName = config.address;

        thunderbird = {
          enable = true;
          settings = id: {
            "mail.identity.id_${id}.reply_on_top" = 1;
            "mail.identity.id_${id}.sig_bottom" = false;
            # Sorting
            "mailnews.default_sort_order" = 2; # descending
            "mailnews.default_sort_type" = 18; # by date
            # Disable telemetry
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.rejected" = true;
            "toolkit.telemetry.prompted" = 2;
          };
        };
      }
      // config
    ) {

       Icloud = {
        address = "philip.rapp@me.com";

        primary = true;

        imap = {
          host = "imap.mail.me.com";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "smtp.mail.me.com";
          port = 587;
          tls.useStartTls = true;
        };

      };

     GoogleMain = {
        address = "philip.rapp@gmail.com";

        imap = {
          host = "imap.gmail.com";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "smtp.gmail.com";
          port = 587;
          tls.enable = true;
        };

      };

      junk = {
        address = "ext.prapp@gmail.com";

        imap = {
          host = "imap.gmail.com";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "smtp.gmail.com";
          port = 587;
          tls.enable = true;
        };

      };

      alerts = {
        address = "alerts.rapprocks@gmail.com";

        imap = {
          host = "imap.gmail.com";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "smtp.gmail.com";
          port = 587;
          tls.enable = true;
        };

      };

    };
}
