from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen, Match
from libqtile.lazy import lazy
import os

home = os.path.expanduser("~")

sticky = []


@hook.subscribe.setgroup
def move_sticky():
    for window in sticky:
        window.togroup()


@hook.subscribe.client_killed
def remove_sticky(window):
    if window in sticky:
        sticky.remove(window)


@hook.subscribe.client_new
def add_sticky(window):
    if window.name == "Picture-in-Picture":
        sticky.append(window)


@lazy.function
def toggle_sticky(qtile):
    window = qtile.current_window

    if window in sticky:
        sticky.remove(window)
    else:
        sticky.append(window)


groups = [
    Group("1", spawn=["codium"]),
    Group("2", spawn=["firefox"]),
    Group("3", spawn=[]),
    Group("4", spawn=["telegram-desktop"]),
    Group("5", spawn=["blueman-manager"]),
] + [Group(i) for i in "6789"]

mod = "mod4"
alt = "mod1"

keys = (
    [
        Key([mod], "r", lazy.spawn("rofi -show drun")),
        Key([mod], "e", lazy.spawn("Thunar")),
        Key([mod], "Return", lazy.spawn("alacritty")),
        Key([mod], "q", lazy.window.kill()),
        Key([mod], "s", toggle_sticky),
        Key([mod, "shift"], "r", lazy.reload_config()),
        Key([mod], "f", lazy.window.toggle_floating()),
        Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),
        Key([mod], "v", lazy.spawn("clipmenu")),
        Key([mod], "p", lazy.spawn("xcolor -S 12 -s clipboard")),
        Key([], "Print", lazy.spawn(f"scrot {home}/MyMedia/%Y-%m-%d_%H-%M-%S.png")),
        Key(
            [mod],
            "Print",
            lazy.spawn(f"scrot {home}/MyMedia/%Y-%m-%d_%H-%M-%S.png -s"),
        ),
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
        Key([mod, "shift"], "Left", lazy.layout.grow_left()),
        Key([mod, "shift"], "Right", lazy.layout.grow_right()),
        Key([mod, "shift"], "Up", lazy.layout.grow_down()),
        Key([mod, "shift"], "Down", lazy.layout.grow_up()),
    ]
    + [Key([mod], i.name, lazy.group[i.name].toscreen()) for i in groups]
    + [Key([mod, "shift"], i.name, lazy.window.togroup(i.name)) for i in groups]
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="line",
                    highlight_color=["#000000", "#393939"],
                    inactive="#767676",
                    this_current_screen_border="#767676",
                    this_screen_border="#767676",
                ),
                widget.Spacer(length=4),
                widget.WindowName(),
                widget.Clock(format="%B-%d %a"),
                widget.Spacer(length=2),
                widget.Clock(format="%H:%M.%S"),
                widget.Spacer(length=6),
                widget.Net(format="↓{down:.2f}Mb", prefix="M"),
                widget.Net(format="↑{up:.2f}Mb", prefix="M"),
                widget.CPU(format="{load_percent:2.0f}%"),
                widget.Memory(format="{MemUsed:.2f}Gb", measure_mem="G"),
                widget.Spacer(length=4),
                widget.Systray(),
                widget.Spacer(length=4),
            ],
            22,
        ),
        background="#191919",
    )
]

layouts = [layout.Columns(insert_position=1)]

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
        Match(title="Proton VPN"),
    ]
)
