{
  username,
  pkgs,
  ...
}:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      rebuild = "cd ~/nixos-config && sudo nixos-rebuild switch --flake .";
      up = "sudo tailscale up";
      down = "sudo tailscale down";
      clean-boot = "sudo /run/current-system/bin/switch-to-configuration boot";
      gc = "sudo nix-collect-garbage -d";
      optimize = "sudo nix-store --optimise";
    };
  };

  home-manager.users.${username} = {
    programs.fish = {
      enable = true;

      plugins = [
        {
          name = "tide";
          src = pkgs.fishPlugins.tide.src;
        }
      ];
    };
  };
}
