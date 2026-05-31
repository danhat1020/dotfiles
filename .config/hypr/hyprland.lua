------------------
---- MONITORS ----
------------------

hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1080@60",
  position = "0x0",
  scale    = "1.0",
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = 'kitty'
local browser     = 'firefox'
local fileManager = 'nautilus'
local menu        = 'fuzzel'

-------------------
---- AUTOSTART ----
-------------------

hl.on('hyprland.start', function()
  hl.exec_cmd('awww-daemon')
  hl.exec_cmd('awww img ~/.config/hypr/backgrounds/scenery.png')
  hl.exec_cmd('waybar')
  hl.exec_cmd('wl-gammarelay')
  hl.exec_cmd('blueman-applet &')
  hl.exec_cmd('wl-paste --watch cliphist store')
  hl.exec_cmd('systemctl --user start hyprpolkitagent')
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    border_size      = 0,
    gaps_in          = 0,
    gaps_out         = 0,

    col              = {
      active_border   = "rgba(128, 128, 128, 1.0)",
      inactive_border = "rgba(32,  32,  32,  1.0)",
    },

    layout           = "monocle",
    resize_on_border = false,
    allow_tearing    = false,
  },

  decoration = {
    rounding         = 0,
    rounding_power   = 0,

    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow           = { enabled = false },
    blur             = { enabled = false },
  },

  animations = { enabled = false },
})

hl.curve("smoothOut", { type = "bezier", points = { { 0.25, 0.90 }, { 0.35, 1.00 } } })
hl.curve("smoothInOut", { type = "bezier", points = { { 0.40, 0.00 }, { 0.20, 1.00 } } })
hl.curve("subtle", { type = "bezier", points = { { 0.22, 0.90 }, { 0.30, 1.00 } } })
hl.curve("stylish", { type = "bezier", points = { { 0.20, 1.00 }, { 0.15, 1.00 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3.0, bezier = "stylish", style = "popin 96%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4.5, bezier = "smoothInOut", style = "popin 96%" })
hl.animation({ leaf = "border", enabled = true, speed = 2.0, bezier = "subtle" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.0, bezier = "smoothInOut" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.0, bezier = "subtle" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.0, bezier = "subtle", style = "popin 96%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3.0, bezier = "smoothInOut", style = "popin 96%" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3.0, bezier = "subtle" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 3.0, bezier = "smoothInOut" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.6, bezier = "stylish", style = "fade" })

hl.config({ master = { new_status = "master" } })

----------------
----  MISC  ----
----------------

hl.config({ misc = { force_default_wallpaper = 0, disable_hyprland_logo = true } })
hl.config({ render = { cm_sdr_eotf = 3 } })

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout      = "us",
    kb_variant     = "",
    kb_model       = "",
    kb_options     = "ctrl:nocaps",
    kb_rules       = "",

    sensitivity    = 0.2,
    accel_profile  = "flat",
    force_no_accel = true,
    follow_mouse   = 0,

    repeat_delay   = 200,
    repeat_rate    = 40,

    touchpad       = {
      natural_scroll = true,
      scroll_factor  = 0.5,
    },
  },
})

hl.config({ binds = { drag_threshold = 1 } })

hl.config({ cursor = { hide_on_key_press = true } })

------------------
---- KEYBINDS ----
------------------

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.kill())
hl.bind("SUPER + X", hl.dsp.exit())
hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + Space", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("~/.config/waybar/scripts/toggle.sh"))
hl.bind("SUPER + G", hl.dsp.exec_cmd("wl-gammarelay &"))
hl.bind("SUPER + F", function()
  hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
  hl.dispatch(hl.dsp.window.center())
end)

-- Move focus with mainMod + vim keys
hl.bind("SUPER + H", hl.dsp.layout("cyclenext"))
hl.bind("SUPER + L", hl.dsp.layout("cycleprev"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move (resize) windows with mainMod + mouse (+ SHIFT)
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e1 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e1 -n2 set 5%-"), { locked = true, repeating = true })
-- Extra brightness
hl.bind("SUPER + bracketleft",
  hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d -0.05"),
  { locked = true, repeating = true })
hl.bind("SUPER + bracketright",
  hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d +0.05"),
  { locked = true, repeating = true })
hl.bind("SUPER + P",
  hl.dsp.exec_cmd("busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d 1.0"),
  { locked = true })
-- Screen temperature
hl.bind("SUPER + Up",
  hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +500"),
  { locked = true, repeating = true })
hl.bind("SUPER + Down",
  hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -500"),
  { locked = true, repeating = true })
hl.bind("SUPER + SHIFT + P",
  hl.dsp.exec_cmd("busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500"),
  { locked = true })
-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Window rules
hl.window_rule({
  match = { float = true },
  border_size = 2,
})
