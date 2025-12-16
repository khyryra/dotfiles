{
  hostname,
  ...
}:

{
  networking = {
    hostName = hostname;
    networkmanager.enable = true;

    firewall = {
      # Open ports in the firewall.
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];

      checkReversePath = "loose";
    };
  };
}
