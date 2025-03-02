from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Screen, Match, MatchAny
from libqtile.lazy import lazy
import os

home = os.path.expanduser('~')

groups = [
    Group("1", spawn=["codium"]),
    Group("2", spawn=["firefox"]),
    Group("3", spawn=[]),
    Group("4", spawn=["telegram-desktop"]),
    Group("5", spawn=["virt-manager", "blueman-manager", "alacritty -e 'btop'"]),
] + [Group(i) for i in "6789"]

mod = "mod4"
keys = [
    Key(["mod1"], "Shift_L", lazy.widget["keyboardlayout"].next_keyboard()),

    Key([mod], "r", lazy.spawn("rofi -show drun")),
    Key([mod], "e", lazy.spawn("Thunar")),
    Key([mod], "Return", lazy.spawn("alacritty")),

    Key([mod], "q", lazy.window.kill()),

    Key([mod, "shift"], "r", lazy.reload_config()),

    Key([mod], "f", lazy.window.toggle_floating()),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),

    Key([mod], "v", lazy.spawn("clipmenu")),

    Key([mod], "p", lazy.spawn("xcolor -S 12 -s clipboard")),

    Key([ ], "Print", lazy.spawn(f"scrot {home}/MyMedia/%Y-%m-%d_%H-%M-%S.png")),
    Key([mod], "Print", lazy.spawn(f"scrot {home}/MyMedia/%Y-%m-%d_%H-%M-%S.png -s")),

    Key([mod], "F9", lazy.spawn("brightnessctl set 10%-")),
    Key([mod], "F10", lazy.spawn("brightnessctl set +10%")),

    Key([mod], "F11", lazy.spawn("pamixer -d 10")),
    Key([mod], "F12", lazy.spawn("pamixer -i 10")),

    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "Up", lazy.layout.down()),
    Key([mod], "Down", lazy.layout.up()),

    Key([mod, "control"], "Left", lazy.layout.shuffle_left()),
    Key([mod, "control"], "Right", lazy.layout.shuffle_right()),
    Key([mod, "control"], "Up", lazy.layout.shuffle_down()),
    Key([mod, "control"], "Down", lazy.layout.shuffle_up()),
] + [
    Key([mod], i.name, lazy.group[i.name].toscreen()) for i in groups
] + [
    Key([mod, "shift"], i.name, lazy.window.togroup(i.name)) for i in groups
]

screens = [
    Screen(
        top=bar.Bar([
            widget.GroupBox(
                highlight_method="line",
                highlight_color=["#000000", "#393939"],
                inactive="#767676",
                this_current_screen_border="#767676",
                this_screen_border="#767676"
            ),
            widget.Spacer(length=4),
            widget.WindowName(),

            widget.Clock(format="%B-%d %a"),
            widget.Spacer(length=4),

            widget.Clock(format="%H:%M.%S"),
            widget.Spacer(length=4),

            widget.KeyboardLayout(configured_keyboards=["en", "ru"]),
            widget.Spacer(length=4),

            widget.Net(format="↓{down:.0f}{down_suffix}"),
            widget.Net(format="↑{up:.0f}{up_suffix}"),
            widget.CPU(format="{load_percent:.0f}%"),
            widget.Memory(format="{MemUsed:.1f}{mm}", measure_mem='G'),
            widget.Spacer(length=4),

            widget.Systray(),
            widget.Spacer(length=4),
        ], 22),
        background="#191919"
    )
]

layouts = [ layout.Bsp() ]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

follow_mouse_focus = True

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),

        Match(title="Picture-in-Picture"),
        Match(wm_class="Picture-in-Picture"),
    ]
)

@hook.subscribe.client_new
def make_pip_sticky(window):
    if window.match(
        MatchAny(
            Match(title="Picture-in-Picture"),
            Match(wm_class="Picture-in-Picture")
        )
    ):
        window.sticky = True
        window.floating = True
