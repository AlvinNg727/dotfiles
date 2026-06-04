local mod = "SUPER"
local shift = "SHIFT"
local control = "CONTROL"
local alt = "ALT"
local tab = "TAB"
local escape = "ESCAPE"
local left = "LEFT"
local right = "RIGHT"
local up = "UP"
local down = "DOWN"
local left_click = "mouse:272"
local right_click = "mouse:273"

local function combo(keys)
    return table.concat(keys, " + ")
end

-- Audio
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("swayosd-client --output-volume +5"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("swayosd-client --output-volume -5"),
    { locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("swayosd-client --playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("swayosd-client --playerctl next"), { locked = true })

-- Brightness
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("swayosd-client --brightness +2 --device intel_backlight"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("swayosd-client --brightness -2 --device intel_backlight"),
    { locked = true, repeating = true }
)

-- Notifications
hl.bind(combo({ mod, "N" }), hl.dsp.exec_cmd("swaync-client -t -sw"))

-- Basic
-- hl.bind(combo({ mod, shift, "C" }), hl.dsp.exec_cmd("/home/alvin/.config/hypr/scripts/killactive.sh")) -- TODO: update to lua function
hl.bind(combo({ mod, shift, "C" }), hl.dsp.window.close())
hl.bind(combo({ mod, control, "M" }), hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(combo({ alt, tab }), function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)
hl.bind(combo({ mod, "S" }), hl.dsp.window.float())
hl.bind(combo({ mod, "F" }), hl.dsp.window.fullscreen())
hl.bind(combo({ mod, shift, "F" }), hl.dsp.window.fullscreen_state({ internal = 2, client = 0 }))
hl.bind(combo({ mod, control, shift, "F" }), hl.dsp.window.fullscreen_state({ internal = 1, client = 0 }))
hl.bind("PRINT", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh copy"))
hl.bind(combo({ mod, "PRINT" }), hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh save"))
hl.bind(combo({ shift, "PRINT" }), hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh copy_full"))
hl.bind(combo({ mod, shift, "PRINT" }), hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh save_full"))
hl.bind("F10", hl.dsp.exec_cmd("hyprlock"))

-- Special workspaces
hl.bind(combo({ mod, "GRAVE" }), hl.dsp.workspace.toggle_special())
hl.bind(combo({ mod, shift, "GRAVE" }), hl.dsp.window.move({ workspace = "special" }))

-- Groups
hl.bind(combo({ mod, "G" }), hl.dsp.group.toggle())
hl.bind(combo({ mod, tab }), hl.dsp.group.next())
hl.bind(combo({ mod, shift, tab }), hl.dsp.group.prev())

-- Change focus
hl.bind(combo({ mod, left }), hl.dsp.focus({ direction = "left" }), { repeating = true })
hl.bind(combo({ mod, "H" }), hl.dsp.focus({ direction = "left" }), { repeating = true })
hl.bind(combo({ mod, right }), hl.dsp.focus({ direction = "right" }), { repeating = true })
hl.bind(combo({ mod, "L" }), hl.dsp.focus({ direction = "right" }), { repeating = true })
hl.bind(combo({ mod, up }), hl.dsp.focus({ direction = "up" }), { repeating = true })
hl.bind(combo({ mod, "K" }), hl.dsp.focus({ direction = "up" }), { repeating = true })
hl.bind(combo({ mod, down }), hl.dsp.focus({ direction = "down" }), { repeating = true })
hl.bind(combo({ mod, "J" }), hl.dsp.focus({ direction = "down" }), { repeating = true })

-- Workspace
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0

    hl.bind(combo({ mod, key }), hl.dsp.focus({ workspace = i }))
    hl.bind(combo({ mod, shift, key }), hl.dsp.window.move({ workspace = i }))
    hl.bind(combo({ alt, key }), hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Change workspace
hl.bind(combo({ mod, control, left }), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(combo({ mod, control, "H" }), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(combo({ mod, control, right }), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(combo({ mod, control, "L" }), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(combo({ mod, "mouse_down" }), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(combo({ mod, "mouse_up" }), hl.dsp.focus({ workspace = "e-1" }))

-- Move active window to workspace
hl.bind(combo({ mod, shift, left }), hl.dsp.window.move({ workspace = "-1" }))
hl.bind(combo({ mod, shift, "H" }), hl.dsp.window.move({ workspace = "-1" }))
hl.bind(combo({ mod, shift, right }), hl.dsp.window.move({ workspace = "+1" }))
hl.bind(combo({ mod, shift, "L" }), hl.dsp.window.move({ workspace = "+1" }))
hl.bind(combo({ alt, "H" }), hl.dsp.window.move({ workspace = "-1", follow = false }))
hl.bind(combo({ alt, "L" }), hl.dsp.window.move({ workspace = "+1", follow = false }))

-- Move windows
hl.bind(combo({ mod, shift, control, left }), hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(combo({ mod, shift, control, "H" }), hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(combo({ mod, shift, control, right }), hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(combo({ mod, shift, control, "L" }), hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(combo({ mod, shift, control, up }), hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(combo({ mod, shift, control, "K" }), hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(combo({ mod, shift, control, down }), hl.dsp.window.move({ direction = "down", group_aware = true }))
hl.bind(combo({ mod, shift, control, "J" }), hl.dsp.window.move({ direction = "down", group_aware = true }))
hl.bind(combo({ mod, left_click }), hl.dsp.window.drag(), { mouse = true })

-- Dwindle
hl.bind(combo({ mod, "A" }), hl.dsp.layout("swapsplit"))

-- Resize
hl.bind(combo({ mod, right_click }), hl.dsp.window.resize(), { mouse = true })
hl.bind(combo({ alt, "R" }), hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind(left, hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind(right, hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind(up, hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind(down, hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

    hl.bind(escape, hl.dsp.submap("reset"))
end)

-- Applications
hl.bind(combo({ mod, "RETURN" }), hl.dsp.exec_cmd("wezterm"), { submap_universal = true })
hl.bind(combo({ mod, "SPACE" }), hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(combo({ mod, "F10" }), hl.dsp.exec_cmd("wlogout"), { submap_universal = true })
hl.bind(combo({ mod, "E" }), hl.dsp.exec_cmd("thunar"))
hl.bind(combo({ mod, "B" }), hl.dsp.exec_cmd("zen-browser"))
hl.bind(combo({ mod, "V" }), hl.dsp.exec_cmd("code"))
