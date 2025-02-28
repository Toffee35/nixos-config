from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os

@hook.subscribe.startup_once
def set_background():
    os.system("xsetroot -solid '#262626'")

mod = "mod4"
groups = [Group(i) for i in "123456789"]
keys = [
    Key([mod], "r", lazy.spawn("rofi -show drun")),
    Key([mod], "e", lazy.spawn("Thunar")),
    Key([mod], "Return", lazy.spawn("alacritty")),

    Key([mod], "q", lazy.window.kill()),

    Key([mod, "shift"], "r", lazy.reload_config()),

    Key([mod], "f", lazy.window.toggle_floating()),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),

    Key([mod], "F9", lazy.spawn("brightnessctl set 10%-")),
    Key([mod], "F10", lazy.spawn("brightnessctl set +10%")),

    Key([mod], "F11", lazy.spawn("pamixer -d 10")),
    Key([mod], "F12", lazy.spawn("pamixer -i 10")),

    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Up", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Down", lazy.layout.up(), desc="Move focus up"),

    Key([mod, "control"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "control"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "control"], "Up", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "control"], "Down", lazy.layout.shuffle_up(), desc="Move window up"),
] + [
    Key([mod], i.name, lazy.group[i.name].toscreen(), desc=f"Switch to group {i.name}") for i in groups
] + [
    Key([mod, "shift"], i.name, lazy.window.togroup(i.name), desc=f"Switch to & move focused window to group {i.name}") for i in groups
]
layouts = [
    layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=2),
    layout.Max()
]
widget_defaults = dict(font="sans", fontsize=12, padding=3)
extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        top=bar.Bar([
            widget.GroupBox(),
            widget.WindowName(),
            widget.Chord(
                chords_colors={"launch": ("#ff0000", "#ffffff")},
                name_transform=lambda name: name.upper(),
            ),
            widget.Systray(),
            widget.Clock(format="%A-%d %H:%M.%S"),
        ], 24)
    )
]
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
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
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"