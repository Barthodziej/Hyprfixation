hl.env("NEWT_COLORS","root=,default;window=,default;border=blue,default;shadow=,default;title=default,default;label=default,default;button=blue,default;compactbutton=default,default;listbox=default,default;actlistbox=blue,default;actsellistbox=blue,default;textbox=default,default;entry=default,default;actentry=default,blue;disentry=white,default;checkbox=default,default;actcheckbox=blue,default;")

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})
-- Default external
hl.monitor({
    output = "HDMI-A-1",
    mode = "1280x720@60",
    position = "-1920x0",
    scale = 1
})
-- My own monitor
hl.monitor({
    output = "desc:Philips Consumer Electronics Company 24E2N1110 UHB2528024458",
    mode="preferred",
    position="auto-left",
    scale="auto"
})

local terminal = "kitty"
local menu = "pkill wofi || wofi --show drun"

hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -i /usr/share/backgrounds/hueco-mundo.jpeg")
    hl.exec_cmd("waybar")
end)

hl.env("GNOME_KEYRING_CONTROL", "$XDG_RUNTIME_DIR/keyring")
hl.env("XCURSOR_SIZE", 24)

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = {
                colors = {
                    "rgba(268aabff)", 
                    "rgba(9ad1e3ff)",
                    "rgba(9ad1e3ff)",
                    "rgba(268aabff)"
                },
                angle = 90
            },
            inactive_border = "rgba(595959aa)"
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },
    decoration = {
        rounding       = 0,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aaa)"
        },
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 2,
            vibrancy  = 0.1696
        }
    },
    animations = {
        enabled = true
    }
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("smooth",         { type = "bezier", points = { {0.75, 0},    {0.25, 1}    } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 2.5,  bezier = "smooth",       style = "slide" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.window_rule({
    name = "floating_nmtui",
    match = {
        class = "floating_nmtui"
    },
    float = true,
    size = {600, 500}
})

hl.window_rule({
    name = "floating_bluetui",
    match = {
        class = "floating_bluetui"
    },
    float = true,
    size = {600, 500}
})

hl.window_rule({
    name = "floating_wiremix",
    match = {
        class = "floating_wiremix"
    },
    float = true,
    size = {800, 600}
})

hl.window_rule({
    name = "floating_gcolor",
    match = {
        class = "nl.hjdskes.gcolor3"
    },
    float = true,
    center = true
})

-- Layouts
hl.config({
    dwindle = {
        preserve_split = true
    },
})

hl.config({
    input = {
        kb_layout  = "pl",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity = 0, 
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

local togglenmtui = hl.dsp.exec_cmd(
    [[
        if hyprctl clients | grep "class: floating_nmtui"; then
            pkill -f "kitty --class floating_nmtui"
        else 
            kitty --class "floating_nmtui" -e nmtui;
        fi
    ]]
)

local togglebluetui = hl.dsp.exec_cmd(
    [[
        if hyprctl clients | grep "class: floating_bluetui"; then
            pkill -f "kitty --class floating_bluetui"
        else 
            kitty --class "floating_bluetui" -e bluetui;
        fi
    ]]
)

local togglewiremix = hl.dsp.exec_cmd([[
        if hyprctl clients | grep "class: floating_wiremix"; then
            pkill -f "kitty --class floating_wiremix"
        else 
            kitty --class "floating_wiremix" -e wiremix;
        fi
    ]]
)

local togglegcolor = hl.dsp.exec_cmd([[
        if hyprctl clients | grep "class: nl.hjdskes.gcolor3"; then
            pkill -f "gcolor3"
        else 
            hyprctl dispatch 'hl.dsp.exec_cmd("gcolor3 | head -c -1 | ifne wl-copy")'
        fi
    ]]
)

local mainMod = "SUPER" 

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + N", togglenmtui)
hl.bind(mainMod .. " + B", togglebluetui)
hl.bind(mainMod .. " + W", togglewiremix)
hl.bind(mainMod .. " + C", togglegcolor)
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("dm-tool lock"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
    mainMod .. " + CTRL + left",
    hl.dsp.window.resize({ x = -20, y = 0,  relative = true }),
    {
        repeating = true
    }
)
hl.bind(
    mainMod .. " + CTRL + right",
    hl.dsp.window.resize({ x = 20, y = 0,  relative = true }),
    {
        repeating = true
    }
)
hl.bind(
    mainMod .. " + CTRL + up",
    hl.dsp.window.resize({ x = 0, y = -20,  relative = true }),
    {
        repeating = true
    }
)
hl.bind(
    mainMod .. " + CTRL + down",
    hl.dsp.window.resize({ x = 0, y = 20,  relative = true }),
    {
        repeating = true
    }
)

hl.bind("XF86AudioRaiseVolume", 
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    {
        locked = true,
        repeating = true
    }
)
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    {
        locked = true,
        repeating = true
    }
)
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    {
        locked = true,
        repeating = true
    }
)
hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    {
        locked = true,
        repeating = true
    }
)
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    {
        locked = true,
        repeating = true
    }
)
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { 
        locked = true, 
        repeating = true 
    }
)

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Screenshots
-- Entire monitor
hl.bind("Print", hl.dsp.exec_cmd([[
    grim -o "$(hyprctl monitors all -j | jq -r '.[] | select (.focused == true) | .name')" - | wl-copy
]]))
-- Focused window
hl.bind("CTRL + Print", hl.dsp.exec_cmd([[
    grimblast copysave active
]]))
-- Selection
hl.bind("ALT + Print", hl.dsp.exec_cmd([[
    grim -g "$(slurp)" - | wl-copy
]]))

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
