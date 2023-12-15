{
  config,
  pkgs,
  ...
}: let
  notionScript = pkgs.writeShellApplication {
    name = "notion";
    runtimeInputs = [pkgs.chromium];
    text = ''
      swaymsg exec 'chromium --app=https://www.notion.so/'
    '';
  };
  notionDeskopItem = pkgs.makeDesktopItem {
    name = "notion";
    exec = "${notionScript}/bin/notion";
    desktopName = "Notion";
    genericName = "Productivity";
    comment = "Notion as Chromium web app.";
    startupWMClass = "notion";
    terminal = true;
  };
in {
  home.packages = [notionDeskopItem notionScript];
}
