{
  username,
  ...
}:

{
  users.users.${username} = {
    isNormalUser = true;
    description = "Khyra";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
