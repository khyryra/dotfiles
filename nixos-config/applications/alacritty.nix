{
  username,
  ...
}:

{
  home-manager.users.${username} = {
    programs.alacritty = {
      enable = true;

      settings.terminal.shell = "fish";

      settings.mouse.bindings = [
        {
          mouse = "Right";
          action = "Copy";
        }
      ];
    };
  };
}
