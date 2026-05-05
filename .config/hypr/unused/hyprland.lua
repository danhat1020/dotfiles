------------------
---- MONITORS ----
------------------

hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1080@60",
  position = "0x0",
  scale    = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = 'kitty'
local browser     = 'firefox'
local fileManager = 'dolphin'
local menu        = 'rofi -show drun'

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd('awww-daemon')
  hl.exec_cmd('awww img ~/.config/hypr/backgrounds/arch.png')
  hl.exec_cmd('waybar')
  hl.exec_cmd('wl-gammarelay')
  hl.exec_cmd('blueman-applet &')
  hl.exec_cmd('wl-paste --watch cliphist store')
  hl.exec_cmd('systemctl --user start hyprpolkitagent')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_SIZE", "30")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    border_size = 2,
    gaps_in     = 4,
    gaps_out    = 0,

    col = {
      active_border   = "rgba(255, 255, 255, 0.6)",
      inactive_border = "rgba(255, 255, 255, 0.1)",
    },

    layout           = "dwindle",
    resize_on_border = false,
    allow_tearing    = false,
  },

  decoration = {
    rounding       = 0,
    rounding_power = 2,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = { enabled = false },
    blur   = { enabled = false },
  },

  animations = { enabled = true },
})

hl.curve("smoothOut",   { type = "bezier", points = { {0.25, 0.90}, {0.35, 1.00} } })
hl.curve("smoothInOut", { type = "bezier", points = { {0.40, 0.00}, {0.20, 1.00} } })
hl.curve("subtle",      { type = "bezier", points = { {0.22, 0.90}, {0.30, 1.00} } })
hl.curve("stylish",     { type = "bezier", points = { {0.20, 1.00}, {0.15, 1.00} } })

hl.animation({ leaf = "windows",       enabled = true, speed = 3.0, bezier = "stylish",     style = "popin 96%"    })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 2.5, bezier = "smoothInOut", style = "popin 96%"    })
hl.animation({ leaf = "border",        enabled = true, speed = 4.5, bezier = "subtle"                              })
hl.animation({ leaf = "fade",          enabled = true, speed = 2.5, bezier = "smoothInOut"                         })
hl.animation({ leaf = "layers",        enabled = true, speed = 2.5, bezier = "subtle"                              })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 2.5, bezier = "subtle",      style = "slide bottom" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 2.5, bezier = "smoothInOut", style = "slide bottom" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 2.5, bezier = "subtle"                              })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.5, bezier = "smoothInOut"                         })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 3.0, bezier = "stylish",     style = "slide"        })

hl.config({
  dwindle = {
    pseudotile     = true,
    preserve_split = true,
    force_split    = 2
  },
})

hl.config({ master = { new_status = "master" } })

----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo   = true,
  },
})

hl.config({ render = { cm_sdr_eotf = 3 } })

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout  = "us",
    kb_variant = "",
    kb_model   = "",
    kb_options = "ctrl:nocaps",
    kb_rules   = "",

    sensitivity    = 0.2,
    accel_profile  = "flat",
    force_no_accel = true,
    follow_mouse   = 0,

    repeat_delay = 200,
    repeat_rate  = 40,

    touchpad = {
      natural_scroll = true,
    },
  },
})

hl.config({
  binds = { drag_threshold = 1 },
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Q",         hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + X",         hl.dsp.exit())
hl.bind(mainMod .. " + Return",    hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Space",     hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + W",         hl.dsp.exec_cmd("~/.config/waybar/scripts/toggle.sh"))
hl.bind(mainMod .. " + F",         hl.dsp.window.float({ action = "toggle" }))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down"  }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Resize focused window with mainMod + SHIFT + vim keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -30, y =   0 }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x =   0, y =  30 }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x =   0, y = -30 }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x =  30, y =   0 }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i}))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move (resize) windows with mainMod + mouse (+ SHIFT)
hl.bind(mainMod .. " + mouse:272",         hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 4%+"),                                       { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%-"),                                            { locked = true, repeating = true })
hl.bind("XF86AudioMute",           hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),                                           { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),                                         { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",     hl.dsp.exec_cmd("brightnessctl -e1 -n2 set 5%+"),                                                        { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",   hl.dsp.exec_cmd("brightnessctl -e1 -n2 set 5%-"),                                                        { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500"), { locked = true, repeating = true })
hl.bind(mainMod .. " + Up",        hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +500"),   { locked = true, repeating = true })
hl.bind(mainMod .. " + Down",      hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -500"),   { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
