hl.monitor({ output = "eDP-1", mode = "highres", position = "0x0", scale = 1.6, bitdepth = 10 }) -- using integrated gpu
hl.monitor({ output = "eDP-2", mode = "highres", position = "0x0", scale = 1.6, bitdepth = 10 }) -- using nvidia gpu
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
