{
  pkgs,
  ...
}:

{
  stylix = {
    enable = true;

    image = ../wallpapers/wallpaper.jpg;

    fonts = {
      serif = {
        package = pkgs.inter;
        name = "Inter";
      };

      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };

      monospace = {
        package = pkgs.nerd-fonts.zed-mono;
        name = "ZedMono Nerd Font";
      };

      sizes = {
        applications = 14;
        desktop = 14;
        popups = 14;
        terminal = 14;
      };
    };

    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
      size = 24;
    };

    opacity = {
      applications = 1.0;
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
    };
  };
}
