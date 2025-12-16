{
  username,
  ...
}:

{
  home-manager.users.${username} = {
    programs.vesktop = {
      enable = true;
    };
  };
}
