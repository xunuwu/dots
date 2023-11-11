{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.xun = {
      extensions = with pkgs.inputs.firefox-addons; [
        ublock-origin
        darkreader
        sponsorblock
        tridactyl
      ];
      bookmarks = { };
      settings = {
        "browser.tabs.inTitleBar" = 0;
        "browser.theme.content-theme" = 2;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "general.autoScroll" = true;
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.download.useDownloadDir" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = false;
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_5a320028-aa5c-401a-8b7e-df62c0d182ab_-browser-action","_f4f4223a-ff30-4961-b9c0-6a71b7a32aaf_-browser-action","myallychou_gmail_com-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","sidebar-button","developer-button","urlbar-container","downloads-button","_799c0914-748b-41df-a25c-22d008f9e83f_-browser-action","preferences-button","unified-extensions-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","_f4f4223a-ff30-4961-b9c0-6a71b7a32aaf_-browser-action","_5a320028-aa5c-401a-8b7e-df62c0d182ab_-browser-action","_799c0914-748b-41df-a25c-22d008f9e83f_-browser-action","myallychou_gmail_com-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","TabsToolbar","toolbar-menubar","unified-extensions-area","widget-overflow-fixed-list"],"currentVersion":19,"newElementCount":23}'';
      };
    };
  };
}
