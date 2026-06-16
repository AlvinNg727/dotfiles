local laptop_monitors = { "eDP-1", "eDP-2" }

local function adjust_monitor_state()
    local file = io.open("/sys/class/power_supply/ADP0/online", "r")

    if file then
        local status = file:read("*all"):gsub("%s+", "") -- Read and strip whitespaces/newlines
        file:close()

        if status == "1" then
            -- laptop plugged in
            for _, name in ipairs(laptop_monitors) do
                hl.monitor({
                    output = name,
                    mode = "3200x2000@165",
                    position = "0x0",
                    scale = 1.6,
                    bitdepth = 10,
                })
            end
        else
            -- laptop on battery
            for _, name in ipairs(laptop_monitors) do
                hl.monitor({
                    output = name,
                    mode = "3200x2000@60",
                    position = "0x0",
                    scale = 1.6,
                    bitdepth = 10,
                })
            end
        end
    end
end

hl.on("hyprland.start", function()
    adjust_monitor_state()
end)
local power_check_timer = hl.timer(function()
    adjust_monitor_state()
end, { timeout = 5000, type = "repeat" })
power_check_timer:set_enabled(true)

-- hl.monitor({ output = "eDP-1", mode = "highres", position = "0x0", scale = 1.6, bitdepth = 10 }) -- using integrated gpu
-- hl.monitor({ output = "eDP-2", mode = "highres", position = "0x0", scale = 1.6, bitdepth = 10 }) -- using nvidia gpu
hl.monitor({
    output = "desc:LG Electronics LG ULTRAGEAR 407NTQD9N436",
    mode = "2560x1440@120",
    position = "auto-left",
    scale = 1.0,
})
hl.monitor({
    output = "desc:Ancor Communications Inc VG248 FCLMQS091194",
    mode = "1920x1080@60",
    position = "auto-right",
    scale = 1.0,
})
hl.monitor({ output = "", mode = "preferred", position = "auto-up", scale = 1.0 })
