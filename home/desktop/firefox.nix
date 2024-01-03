{ config, pkgs, lib, inputs, ... }:

{

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.phil = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        ublock-origin
      ];
      settings = {
        "extensions.pocket.enabled" = false;
        "gfx.webrender.enabled" = true;
        "gfx.webrender.all" = true;
        "browser.tabs.warnOnCloseOtherTabs" = false;
        "browser.tabs.warnOnClose" = false;
        "general.smoothScroll.currentVelocityWeighting" = 0;
        "general.smoothScroll.mouseWheel.durationMaxMS" = 250;
        "general.smoothScroll.stopDecelerationWeighting" = "0.82";
        "mousewheel.min_line_scroll_amount" = 25;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.activeThemeID" = "e7c9fb23-17c0-4bb6-a8ba-ff52a7770b89";
        "ui.systemUsesDarkTheme" = 1;
        "devtools.theme" = "dark";
        "signon.rememberSignons" = false;
        "privacy.trackingprotection.enabled" = true;
        "browser.ssb.enabled" = true;
      };
    };
  };
}
