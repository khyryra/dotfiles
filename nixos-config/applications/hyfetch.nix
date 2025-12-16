{
  username,
  ...
}:

{
  home-manager.users.${username} = {
    programs.hyfetch = {
      enable = true;

      settings = {
        preset = "agender";
        mode = "rgb";
        auto_detect_light_dark = true;
        lightness = 0.5;
        color_align = {
          mode = "horizontal";
        };
        backend = "fastfetch";
        pride_month_disable = true;
      };
    };
  };
}
