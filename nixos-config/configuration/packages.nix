{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    gh
    playerctl
    brightnessctl
    alacritty
    nautilus
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = true;
    })
    fishPlugins.tide
    base16-schemes
    networkmanagerapplet
    hyfetch
    fastfetch
    nil
    nixd
    hyprpicker
    wl-clipboard
    zed-editor
    valent
    bottles
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.zed-mono
    inter
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
