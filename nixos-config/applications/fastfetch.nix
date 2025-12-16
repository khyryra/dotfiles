{
  username,
  ...
}:

{
  home-manager.users.${username} = {
    programs.fastfetch = {
      enable = true;

      settings = {
        logo = {
          type = "auto";
          source = "nixos";

          padding = {
            top = 0;
            left = 2;
            right = 1;
          };

          printRemaining = true;
          position = "left";
        };

        display = {
          disableLinewrap = true;
          separator = "  ";

          color = {
            keys = "yellow";
            title = "green";
            output = "white";
            separator = "yellow";
          };

          brightColor = true;

          duration = {
            abbreviation = true;
          };

          size = {
            maxPrefix = "YB";
            binaryPrefix = "iec";
            ndigits = 2;
          };

          temp = {
            unit = "D";
            ndigits = 1;

            color = {
              green = "32";
              yellow = "93";
              red = "91";
            };
          };

          percent = {
            type = 3;

            color = {
              green = "green";
              yellow = "light_yellow";
              red = "light_red";
            };

            ndigits = 3;
          };

          bar = {
            width = 10;

            char = {
              elapsed = "■";
              total = "-";
            };

            border = {
              left = "[ ";
              right = " ]";
              leftElapsed = "";
              rightElapsed = "";
            };

            color = {
              elapsed = "auto";
              total = 97;
              border = 97;
            };
          };

          fraction = {
            ndigits = 2;
          };

          key = {
            width = 0;
            type = "icon";
            paddingLeft = 1;
          };

          freq = {
            ndigits = 2;
          };
        };

        modules = [
          "title"

          {
            type = "separator";
            string = " ";
          }

          "os"
          "host"
          "kernel"
          "packages"
          "shell"

          {
            type = "separator";
            string = " ";
          }

          "display"
          "de"
          "wm"
          "terminal"

          {
            type = "separator";
            string = " ";
          }

          "cpu"
          "gpu"
          "memory"
          "disk"

          {
            type = "separator";
            string = " ";
          }

          "colors"
        ];
      };
    };
  };
}
