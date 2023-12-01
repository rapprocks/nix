{ config, pkgs, nur, ... }:

{
  
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        isDefault = true;
        settings = {
          "extensions.pocket.enabled" = false;
          "gfx.webrender.enabled" = true;
          "gfx.webrender.all" = true;

          "browser.tabs.warnOnCloseOtherTabs" = false;
          "browser.tabs.warnOnClose" = false;

          # "browser.tabs.firefox-view" = false;

          "general.smoothScroll.currentVelocityWeighting" = 0;
          "general.smoothScroll.mouseWheel.durationMaxMS" = 250;
          "general.smoothScroll.stopDecelerationWeighting" = "0.82";
          "mousewheel.min_line_scroll_amount" = 25;

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "ui.systemUsesDarkTheme" = 1;
          "devtools.theme" = "dark";

          "signon.rememberSignons" = false;

        };
        #extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        #  proton-pass
        #  ublock-origin
        #];
      };
    };
  };
}
