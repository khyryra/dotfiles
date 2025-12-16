{
  pkgs,
  username,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11"; # Did you read the comment?

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = [ "${username}" ];
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
      options = [ "discard" ];
    }
  ];

  systemd.services.mic-mute-led-off = {
    script = ''
      echo 'off' | tee '/sys/class/sound/ctl-led/mic/mode'
    '';
    wantedBy = [ "multi-user.target" ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config = {
      niri = {
        default = [
          "gnome"
          "gtk"
        ];
      };
    };
  };
}
