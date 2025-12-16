{
  inputs,
  system,
  username,
  ...
}:

{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  environment.systemPackages = [
    inputs.noctalia.packages.${system}.default
  ];

  services.noctalia-shell.enable = true;

  home-manager.users.${username} = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;

      settings = {
        appLauncher = {
          customLaunchPrefix = "";
          customLaunchPrefixEnabled = false;
          enableClipPreview = true;
          enableClipboardHistory = true;
          pinnedExecs = [
          ];
          position = "center";
          showCategories = false;
          sortByMostUsed = true;
          terminalCommand = "alacritty -e";
          useApp2Unit = false;
          viewMode = "list";
        };
        audio = {
          cavaFrameRate = 30;
          externalMixer = "pwvucontrol || pavucontrol";
          mprisBlacklist = [
          ];
          preferredPlayer = "";
          visualizerQuality = "low";
          visualizerType = "none";
          volumeOverdrive = true;
          volumeStep = 5;
        };
        bar = {
          density = "comfortable";
          exclusive = true;
          floating = false;
          marginHorizontal = 1;
          marginVertical = 1;
          monitors = [
          ];
          outerCorners = true;
          position = "top";
          showCapsule = false;
          widgets = {
            center = [
              {
                customFont = "";
                formatHorizontal = "HH:mm — dddd, MMMM dd";
                formatVertical = "HH mm - dd MM";
                id = "Clock";
                useCustomFont = false;
                usePrimaryColor = true;
              }
            ];
            left = [
              {
                colorizeDistroLogo = false;
                colorizeSystemIcon = "primary";
                customIconPath = "";
                enableColorization = true;
                icon = "adjustments-horizontal";
                id = "ControlCenter";
                useDistroLogo = false;
              }
              {
                hideWhenZero = true;
                id = "NotificationHistory";
                showUnreadBadge = true;
              }
              {
                id = "plugin:launcher-button";
              }
              {
                id = "ScreenRecorder";
              }
              {
                hideMode = "alwaysExpanded";
                icon = "color-picker";
                id = "CustomButton";
                leftClickExec = "hyprpicker -a -f hex -q";
                leftClickUpdateText = false;
                maxTextLength = {
                  horizontal = 10;
                  vertical = 10;
                };
                middleClickExec = "";
                middleClickUpdateText = false;
                parseJson = false;
                rightClickExec = "";
                rightClickUpdateText = false;
                showIcon = true;
                textCollapse = "";
                textCommand = "";
                textIntervalMs = 3000;
                textStream = false;
                wheelDownExec = "";
                wheelDownUpdateText = false;
                wheelExec = "";
                wheelMode = "unified";
                wheelUpExec = "";
                wheelUpUpdateText = false;
                wheelUpdateText = false;
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
              {
                blacklist = [
                ];
                colorizeIcons = true;
                drawerEnabled = true;
                hidePassive = true;
                id = "Tray";
                pinned = [
                ];
              }
              {
                hideMode = "hidden";
                hideWhenIdle = false;
                id = "MediaMini";
                maxWidth = 200;
                scrollingMode = "hover";
                showAlbumArt = false;
                showArtistFirst = false;
                showProgressRing = true;
                showVisualizer = false;
                useFixedWidth = false;
                visualizerType = "mirrored";
              }
              {
                characterCount = 2;
                colorizeIcons = true;
                followFocusedScreen = false;
                hideUnoccupied = true;
                id = "Workspace";
                labelMode = "none";
                showApplications = true;
                showLabelsOnlyWhenOccupied = false;
              }
            ];
            right = [
              {
                id = "plugin:privacy-indicator";
              }
              {
                displayMode = "forceOpen";
                id = "KeyboardLayout";
              }
              {
                displayMode = "alwaysShow";
                id = "Battery";
                showNoctaliaPerformance = true;
                showPowerProfiles = true;
                warningThreshold = 30;
              }
              {
                displayMode = "onhover";
                id = "Brightness";
              }
              {
                displayMode = "alwaysShow";
                id = "Volume";
              }
              {
                displayMode = "onhover";
                id = "Microphone";
              }
              {
                displayMode = "onhover";
                id = "WiFi";
              }
              {
                displayMode = "onhover";
                id = "Bluetooth";
              }
            ];
          };
        };
        brightness = {
          brightnessStep = 5;
          enableDdcSupport = true;
          enforceMinimum = false;
        };
        calendar = {
          cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = true;
              id = "timer-card";
            }
            {
              enabled = false;
              id = "weather-card";
            }
          ];
        };
        colorSchemes = {
          darkMode = true;
          generateTemplatesForPredefined = false;
          manualSunrise = "06:30";
          manualSunset = "18:30";
          matugenSchemeType = "scheme-fruit-salad";
          predefinedScheme = "Noctalia (default)";
          schedulingMode = "off";
          useWallpaperColors = false;
        };
        controlCenter = {
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = false;
              id = "shortcuts-card";
            }
            {
              enabled = false;
              id = "audio-card";
            }
            {
              enabled = false;
              id = "weather-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "ScreenRecorder";
              }
              {
                id = "WallpaperSelector";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "PowerProfile";
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
            ];
          };
        };
        dock = {
          colorizeIcons = false;
          deadOpacity = 0.6;
          displayMode = "auto_hide";
          enabled = false;
          floatingRatio = 1;
          inactiveIndicators = false;
          monitors = [
          ];
          onlySameOutput = true;
          pinnedApps = [
          ];
          pinnedStatic = false;
          size = 1;
        };
        general = {
          allowPanelsOnScreenWithoutBar = true;
          animationDisabled = false;
          animationSpeed = 2;
          avatarImage = "/home/khyryra/.face";
          boxRadiusRatio = 1;
          compactLockScreen = true;
          dimmerOpacity = 0;
          enableShadows = false;
          forceBlackScreenCorners = true;
          iRadiusRatio = 1;
          language = "";
          lockOnSuspend = true;
          radiusRatio = 0.31;
          scaleRatio = 1;
          screenRadiusRatio = 0.31;
          shadowDirection = "bottom_right";
          shadowOffsetX = 2;
          shadowOffsetY = 3;
          showHibernateOnLockScreen = false;
          showScreenCorners = true;
          showSessionButtonsOnLockScreen = true;
        };
        hooks = {
          darkModeChange = "";
          enabled = false;
          wallpaperChange = "";
        };
        location = {
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
          name = "Denver";
          showCalendarEvents = false;
          showCalendarWeather = true;
          showWeekNumberInCalendar = false;
          use12hourFormat = false;
          useFahrenheit = false;
          weatherEnabled = false;
          weatherShowEffects = true;
        };
        network = {
          wifiEnabled = true;
        };
        nightLight = {
          autoSchedule = true;
          dayTemp = "6500";
          enabled = false;
          forced = false;
          manualSunrise = "06:30";
          manualSunset = "18:30";
          nightTemp = "4000";
        };
        notifications = {
          criticalUrgencyDuration = 5;
          enableKeyboardLayoutToast = true;
          enabled = true;
          location = "top_left";
          lowUrgencyDuration = 2;
          monitors = [
            "eDP-1"
          ];
          normalUrgencyDuration = 2;
          overlayLayer = true;
          respectExpireTimeout = false;
          sounds = {
            criticalSoundFile = "";
            enabled = false;
            excludedApps = "discord,firefox,chrome,chromium,edge";
            lowSoundFile = "";
            normalSoundFile = "";
            separateSounds = false;
            volume = 0.5;
          };
        };
        osd = {
          autoHideMs = 2000;
          enabled = true;
          enabledTypes = [
            0
            1
            2
          ];
          location = "top_right";
          monitors = [
            "eDP-1"
          ];
          overlayLayer = true;
        };
        screenRecorder = {
          audioCodec = "opus";
          audioSource = "default_output";
          colorRange = "limited";
          directory = "/home/khyryra/Videos";
          frameRate = 60;
          quality = "high";
          showCursor = true;
          videoCodec = "av1";
          videoSource = "portal";
        };
        sessionMenu = {
          countdownDuration = 10000;
          enableCountdown = false;
          position = "top_left";
          powerOptions = [
            {
              action = "lock";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "suspend";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "hibernate";
              command = "";
              countdownEnabled = true;
              enabled = false;
            }
            {
              action = "reboot";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "logout";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "shutdown";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
          ];
          showHeader = false;
        };
        settingsVersion = 28;
        systemMonitor = {
          cpuCriticalThreshold = 100;
          cpuPollingInterval = 3000;
          cpuWarningThreshold = 90;
          criticalColor = "#a288a5";
          diskCriticalThreshold = 90;
          diskPollingInterval = 3000;
          diskWarningThreshold = 80;
          gpuCriticalThreshold = 90;
          gpuPollingInterval = 3000;
          gpuWarningThreshold = 80;
          memCriticalThreshold = 90;
          memPollingInterval = 3000;
          memWarningThreshold = 80;
          networkPollingInterval = 3000;
          tempCriticalThreshold = 90;
          tempPollingInterval = 3000;
          tempWarningThreshold = 80;
          useCustomColors = false;
          warningColor = "#dcb26d";
        };
        templates = {
          alacritty = false;
          cava = false;
          code = false;
          discord = false;
          emacs = false;
          enableUserTemplates = false;
          foot = false;
          fuzzel = false;
          ghostty = false;
          gtk = false;
          kcolorscheme = false;
          kitty = false;
          niri = false;
          pywalfox = false;
          qt = false;
          spicetify = false;
          telegram = false;
          vicinae = false;
          walker = false;
          wezterm = false;
          yazi = false;
        };
        ui = {
          fontDefault = "Inter";
          fontDefaultScale = 1;
          fontFixed = "ZedMono Nerd Font";
          fontFixedScale = 1;
          panelsAttachedToBar = true;
          settingsPanelMode = "window";
          tooltipsEnabled = true;
        };
        wallpaper = {
          directory = "/home/khyryra/nixos-config/wallpapers";
          enableMultiMonitorDirectories = false;
          enabled = true;
          fillColor = "#000000";
          fillMode = "crop";
          hideWallpaperFilenames = false;
          monitorDirectories = [
          ];
          overviewEnabled = false;
          panelPosition = "follow_bar";
          randomEnabled = false;
          randomIntervalSec = 300;
          recursiveSearch = false;
          setWallpaperOnAllMonitors = true;
          transitionDuration = 1500;
          transitionEdgeSmoothness = 0.05;
          transitionType = "stripes";
          useWallhaven = false;
          wallhavenCategories = "111";
          wallhavenOrder = "desc";
          wallhavenPurity = "100";
          wallhavenQuery = "";
          wallhavenResolutionHeight = "";
          wallhavenResolutionMode = "atleast";
          wallhavenResolutionWidth = "";
          wallhavenSorting = "relevance";
        };
      };
    };
  };
}
