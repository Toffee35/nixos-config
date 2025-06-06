{homedir, ...}: {
  services.sxhkd = {
    enable = true;

    keybindings = {
      "ctrl + alt + r" = "pkill -USR1 -x sxhkd && bspc wm -r";
      "ctrl + alt + q" = "bspc quit";

      "super + Return" = "alacritty";
      "super + r" = "rofi -show drun";
      "super + e" = "thunar";
      "super + v" = "thunar";
      "super + p" = "xcolor -S 12 -s clipboard";

      "{_,shift + ,super + }XF86MonBrightness{Down,Up}" = "bright {-1,-10,min,+1,+10,max}";
      "{_,super +}XF86LaunchA" = "scrot {_,-s -f} ${homedir}/MyMedia/%Y-%m-%d_%H-%M-%S.png";

      "super + {_,shift + }q" = "bspc node -{c,k}";
      "super + {t,f,shift + f}" = "bspc node -t {tiled,floating,fullscreen}";
      "super + s" = "bspc node -g sticky";

      "super + {1-9,0}" = "bspc desktop -f '^{1-9,10}'";
      "super + shift + {1-9,0}" = "bspc node -d '^{1-9,10}'";
      "super + ctrl + {1-9}" = "bspc node -d '^{1-9,10}' && bspc desktop -f '^{1-9,10}'";
    };
  };
}
