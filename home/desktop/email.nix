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
      personal = {
        address = "philip.rapp@gmail.com";

        primary = true;

        imap = {
          host = "imap.gmail.com";
          port = "993";
          tls.useStartTls = true;
        };

        smtp = {
          host = "smtp.gmail.com";
          port = "587";
          tls.useStartTls = true;
        };

      };
    };
}
