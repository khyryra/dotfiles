{
  inputs,
  pkgs,
  username,
  config,
  lib,
  ...
}:

{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  niri-flake.cache.enable = true;

  programs.niri = {
    enable = true;
    package = pkgs.niri-stable;
  };

  environment.variables.NIXOS_OZONE_WL = "1";

  home-manager.users.${username} = {
    programs.niri.settings = with config.home-manager.users.${username}.lib.niri.actions; {
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;

      screenshot-path = "/mnt/data/Screenshots/Niri %Y-%m-%d %H:%M:%S.png";

      environment = {
        QT_QPA_PLATFORM = "wayland";
      };

      binds = {
        # Empty: Change view
        # Ctrl: Change layout
        # Alt: Symbolizes an alternate action
        # Shift: Symbolizes a bigger action (e.g. fullscreen instead of maximize)

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-window-or-workspace-down;
        "Mod+Up".action = focus-window-or-workspace-up;

        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Right".action = move-column-right;
        "Mod+Ctrl+Down".action = move-window-down-or-to-workspace-down;
        "Mod+Ctrl+Up".action = move-window-up-or-to-workspace-up;

        "Mod+Shift+Left".action = focus-monitor-left;
        "Mod+Shift+Right".action = focus-monitor-right;
        "Mod+Shift+Down".action = focus-monitor-down;
        "Mod+Shift+Up".action = focus-monitor-up;

        "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
        "Mod+Shift+Ctrl+Down".action = move-window-to-monitor-down;
        "Mod+Shift+Ctrl+Up".action = move-window-to-monitor-up;

        "Mod+Alt+Left".action = consume-or-expel-window-left;
        "Mod+Alt+Right".action = consume-or-expel-window-right;

        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+D".action = toggle-window-floating;
        "Mod+Shift+D".action = switch-focus-between-floating-and-tiling;

        "Mod+C".action = toggle-column-tabbed-display;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;

        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;

        "Mod+Ctrl+Alt+Delete".action = quit;

        "Mod+R".action = switch-preset-column-width;

        "Mod+V".action = toggle-overview;

        "Mod+Q".action = close-window;

        "Mod+Escape".action = toggle-keyboard-shortcuts-inhibit;
        "Mod+Escape".allow-inhibiting = false;

        "Mod+T".action = spawn "alacritty";
        "Mod+E".action = spawn "nautilus" "--new-window";
        "Mod+Z".action = spawn "zeditor";

        "Mod+Space".action = spawn "noctalia-shell" "ipc" "call" "launcher" "toggle";
        "Mod+L".action = spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock";

        "Mod+Delete".action = spawn "noctalia-shell" "ipc" "call" "sessionMenu" "toggle";

        "Print".action.screenshot = {
          show-pointer = false;
        };

        "Shift+Print".action.screenshot-screen = {
          show-pointer = false;
        };

        "Alt+Print".action.screenshot-window = { };

        "XF86NotificationCenter" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl play-pause";
        };

        "XF86PickupPhone" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl stop";
        };

        "XF86HangupPhone" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl previous";
        };

        "XF86Favorites" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl next";
        };

        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+";
        };

        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-";
        };

        "Shift+XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
        };

        "Shift+XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        };

        "XF86AudioMute" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        "XF86AudioMicMute" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };

        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action = spawn-sh "brightnessctl --class=backlight set 1%+";
        };

        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action = spawn-sh "brightnessctl --class=backlight set 1%-";
        };

        "Shift+XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action = spawn-sh "brightnessctl --class=backlight set 10%+";
        };

        "Shift+XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action = spawn-sh "brightnessctl --class=backlight set 10%-";
        };
      };

      input = {
        touch = {
          enable = true;
          map-to-output = "eDP-1";
        };

        touchpad = {
          enable = true;
          natural-scroll = true;
          accel-speed = 0.3;
          accel-profile = "adaptive";
          middle-emulation = false;

          tap = true;
          dwt = false;
          dwtp = true;
          drag = true;
          drag-lock = true;
          click-method = "clickfinger";
          disabled-on-external-mouse = true;

          scroll-factor = 0.6;
        };

        mouse = {
          enable = true;

          natural-scroll = false;
          accel-speed = 0.0;
          accel-profile = "adaptive";
          middle-emulation = false;

          scroll-factor = 0.6;
        };

        trackpoint = {
          enable = true;
          accel-speed = -1.0;
        };

        focus-follows-mouse.enable = true;
      };

      outputs.eDP-1 = {
        enable = true;
        scale = 1.0;
      };

      gestures = {
        hot-corners.enable = false;
      };

      switch-events = {
        lid-close.action = spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock";
      };

      cursor = {
        theme = "capitaine-cursors";
        size = 24;
        hide-when-typing = false;
      };

      layout =
        let
          colors = config.lib.stylix.colors.withHashtag;
        in
        {
          gaps = 10;
          always-center-single-column = true;
          empty-workspace-above-first = false;

          preset-column-widths = [
            { proportion = 0.3333333; }
            { proportion = 0.5; }
            { proportion = 0.6666667; }
          ];

          default-column-width = {
            proportion = 0.5;
          };

          focus-ring = {
            enable = true;
            width = 2;
            active = {
              color = colors.base0B;
            };
            inactive = {
              color = colors.base0C;
            };
            urgent = {
              color = colors.base0B;
            };
          };

          border = {
            enable = true;
            width = 2;
            active = {
              color = colors.base0B;
            };
            inactive = {
              color = colors.base0C;
            };
            urgent = {
              color = colors.base0B;
            };
          };

          shadow = {
            enable = false;
          };

          tab-indicator = {
            enable = true;
            hide-when-single-tab = true;
          };

          struts = {
            left = 10;
            right = 10;
            top = 10;
            bottom = 10;
          };
        };

      overview =
        let
          colors = config.lib.stylix.colors.withHashtag;
        in
        {
          zoom = 0.8;
          backdrop-color = colors.base00;

          workspace-shadow = {
            enable = false;
          };
        };

      clipboard = {
        disable-primary = true;
      };

      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 5.0;
            top-right = 5.0;
            bottom-left = 5.0;
            bottom-right = 5.0;
          };

          clip-to-geometry = true;
        }
      ];

      xwayland-satellite.path = "${lib.getExe pkgs.xwayland-satellite}";
    };
  };
}
