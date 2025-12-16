{
  inputs,
  username,
  lib,
  ...
}:

{
  home-manager = {
    backupFileExtension = "bak";

    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs username; };
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.11";
      programs.home-manager.enable = true;

      dconf.settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = ":";
        };

        "org/gnome/desktop/interface" = {
          gtk-enable-primary-paste = false;
        };
      };

      xdg.desktopEntries.vivaldi-stable = lib.mkForce {
        categories = [
          "Network"
          "WebBrowser"
        ];
        exec = "vivaldi --enable-blink-features=MiddleClickAutoscroll %U";
        genericName = "Web Browser";
        icon = "vivaldi";
        mimeType = [
          "text/html"
          "text/xml"
        ];
        name = "Vivaldi";
        terminal = false;
        type = "Application";
      };

      xdg.desktopEntries.vesktop = lib.mkForce {
        categories = [
          "Network"
          "InstantMessaging"
          "Chat"
        ];
        exec = "vesktop --enable-blink-features=MiddleClickAutoscroll %U";
        genericName = "Internet Messenger";
        icon = "vesktop";
        name = "Vesktop";
        type = "Application";
      };
    };
  };
}
