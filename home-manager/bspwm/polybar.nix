{pkgs, ...}: {
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };

    script = "polybar main &";

    config = {
      "colors" = {
        background = "#1e1e2e";
        background-alt = "#313244";
        foreground = "#cdd6f4";
        primary = "#89b4fa";
        secondary = "#f38ba8";
        alert = "#f38ba8";
        disabled = "#6c7086";
      };

      "bar/main" = {
        width = "100%";
        height = "24pt";
        radius = 0;

        background = "\${colors.background}";
        foreground = "\${colors.foreground}";

        line-size = "2pt";
        border-size = "0pt";
        border-color = "#00000000";

        padding-left = 1;
        padding-right = 1;

        module-margin = 1;

        separator = "|";
        separator-foreground = "\${colors.disabled}";

        font-0 = "JetBrains Mono:size=10;2";
        font-1 = "Font Awesome 6 Free Solid:size=10;2";
        font-2 = "Font Awesome 6 Brands:size=10;2";

        modules-left = "bspwm xwindow";
        modules-center = "date";
        modules-right = "filesystem pulseaudio memory cpu temperature battery tray";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;

        tray-position = "right";
        tray-detached = false;
        tray-maxsize = 16;
        tray-padding = 2;
        tray-scale = 1;
      };

      "module/bspwm" = {
        type = "internal/bspwm";

        label-focused = "%index%";
        label-focused-background = "\${colors.background-alt}";
        label-focused-underline = "\${colors.primary}";
        label-focused-padding = 1;

        label-occupied = "%index%";
        label-occupied-padding = 1;

        label-urgent = "%index%!";
        label-urgent-background = "\${colors.alert}";
        label-urgent-padding = 1;

        label-empty = "%index%";
        label-empty-foreground = "\${colors.disabled}";
        label-empty-padding = 1;
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:60:...%";
      };

      "module/filesystem" = {
        type = "internal/fs";
        interval = 25;

        mount-0 = "/";

        label-mounted = "%{F#89b4fa}%mountpoint%%{F-} %percentage_used%%";
        label-unmounted = "%mountpoint% not mounted";
        label-unmounted-foreground = "\${colors.disabled}";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        format-volume-prefix = "VOL ";
        format-volume-prefix-foreground = "\${colors.primary}";
        format-volume = "<label-volume>";

        label-volume = "%percentage%%";

        label-muted = "muted";
        label-muted-foreground = "\${colors.disabled}";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format-prefix = "RAM ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage_used:2%%";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format-prefix = "CPU ";
        format-prefix-foreground = "\${colors.primary}";
        label = "%percentage:2%%";
      };

      "module/temperature" = {
        type = "internal/temperature";
        thermal-zone = 0;
        warn-temperature = 80;

        format = "<ramp> <label>";
        format-warn = "<ramp> <label-warn>";

        label = "%temperature-c%";
        label-warn = "%temperature-c%";
        label-warn-foreground = "\${colors.secondary}";

        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-foreground = "\${colors.primary}";
      };

      "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        adapter = "ADP1";

        format-charging = "<animation-charging> <label-charging>";
        format-discharging = "<ramp-capacity> <label-discharging>";

        label-charging = "Charging %percentage%%";
        label-discharging = "Discharging %percentage%%";
        label-full = "Fully charged";

        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        animation-charging-framerate = 750;
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;

        date = "%H:%M";
        date-alt = "%Y-%m-%d %H:%M:%S";

        label = "%date%";
        label-foreground = "\${colors.primary}";
      };

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
    };
  };
}
