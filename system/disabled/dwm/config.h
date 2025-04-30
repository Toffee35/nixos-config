/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
// static const char dmenufont[]       = "monospace:size=10";

/* GruvBox Color Sheme */
static const char col0_bg[]         = "#282828";
static const char col1_red[]        = "#cc241d";
static const char col2_green[]      = "#98971a";
static const char col3_yellow[]     = "#d79921";
static const char col4_blue[]       = "#458588";
static const char col5_purple[]     = "#b16286";
static const char col6_aqua[]       = "#689d6a";
static const char col7_gray[]       = "#a89984";

static const char col8_gray[]       = "#928374";
static const char col9_red[]        = "#fb4934";
static const char col10_green[]     = "#b8bb26";
static const char col11_yellow[]    = "#fabd2f";
static const char col12_blue[]      = "#83a598";
static const char col13_purple[]    = "#d3869b";
static const char col14_aqua[]      = "#8ec07c";
static const char col15_fg[]        = "#ebdbb2";

static const char col16_bg0_h[]     = "#1d2021";
static const char col17_bg0[]       = "#282828";
static const char col18_bg1[]       = "#3c3836";
static const char col19_bg2[]       = "#504945";
static const char col20_bg3[]       = "#665c54";
static const char col21_bg4[]       = "#7c6f64";
static const char col22_gray[]      = "#928374";
static const char col23_orange[]    = "#d65d0e";

static const char col24_black[]     = "#000000";
static const char col25_bg0_s[]     = "#32302f";
static const char col26_fg4[]       = "#a89984";
static const char col27_fg3[]       = "#bdae93";
static const char col28_fg2[]       = "#d5c4a1";
static const char col29_fg1[]       = "#ebdbb2";
static const char col29_fg0[]       = "#fbf1c7";
static const char col30_orange[]    = "#fe8019";

static const char *colors[][3]      = {
	/*               fg         bg            border   */
	[SchemeNorm] = { col29_fg0, col17_bg0,    col20_bg3 },
	[SchemeSel]  = { col29_fg0, col23_orange, col23_orange  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title                 tags mask     isfloating   monitor */
	// { NULL,       NULL,       NULL,                 0,            False,       -1 },
	{ "Gimp",     NULL,       NULL,                 0,            1,           -1 },
	{ NULL,       NULL,       "Proton VPN",         0,            1,           -1 },
	{ NULL,       NULL,       "Picture-in-Picture", 0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	// { "><>",      NULL },    /* no layout function means floating behavior */
	// { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "", NULL };
static const char *roficmd[] = { "rofi", "-show", "drun", NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *thunarcmd[]  = { "Thunar", NULL };
static const char *clipmenucmd[]  = { "clipmenu", NULL };
static const char *xcolorcmd[]  = { "xcolor", "-S", "12", "-s", "clipboard", NULL };
static const char *scrotcmd[]  = { "scrot", "$HOME/MyMedia/%Y-%m-%d_%H-%M-%S.png", NULL };
static const char *scrotsegmentcmd[]  = { "scrot", "$HOME/MyMedia/%Y-%m-%d_%H-%M-%S.png", "-sf", NULL };
static const char *brigdowncmd[]  = { "brightnessctl", "set", "10%-", NULL };
static const char *brigupcmd[]  = { "brightnessctl", "set", "+%10", NULL };
static const char *voldowncmd[]  = { "pamixer", "-d", "10", NULL };
static const char *volupcmd[]  = { "pamixer", "-i", "10", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_r,      spawn,          {.v = roficmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = thunarcmd } },
	{ MODKEY,                       XK_v,      spawn,          {.v = clipmenucmd } },
	{ MODKEY,                       XK_p,      spawn,          {.v = xcolorcmd } },
	{ 0,                            XK_Print,  spawn,          {.v = scrotcmd } },
	{ MODKEY,                       XK_Print,  spawn,          {.v = scrotsegmentcmd } },
	{ 0,                            XK_F9,     spawn,          {.v = brigdowncmd } },
	{ MODKEY,                       XK_F10,    spawn,          {.v = brigupcmd } },
	{ 0,                            XK_F11,    spawn,          {.v = voldowncmd } },
	{ MODKEY,                       XK_F12,    spawn,          {.v = volupcmd } },
	{ ALTKEY|ControlMask,           XK_q,      quit,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_f,      togglefloating, {0} },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_period, focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_comma,  focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, setmfact,       {.f = +0.05 } },
	{ MODKEY|ShiftMask,             XK_comma,  setmfact,       {.f = -0.05 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkWinTitle,          0,              Button1,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
