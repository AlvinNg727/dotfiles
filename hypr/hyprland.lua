require("binds")
require("envs")
require("monitors")

-- Startup applications
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent") -- Authentication agent
    hl.exec_cmd("dbus-update-activation-environment --systemd --all") -- Update environment for systemd services
    hl.exec_cmd("udiskie -s") -- Start udiskie for automounting
    hl.exec_cmd("wl-clip-persist --clipboard regular") -- Start wl-clipboard daemon for clipboard persistence
    hl.exec_cmd("blueman-applet") -- Start bluetooth applet
    hl.exec_cmd("waybar") -- waybar for status bar
    hl.exec_cmd("swaync") -- swaync for notifications
    hl.exec_cmd("swayosd-server") -- swayosd for on-screen display
    hl.exec_cmd("hyprpaper") -- hyprpaper for wallpaper management
    hl.exec_cmd("hypridle") -- hypridle for idle management

    -- Daily applications
    hl.exec_cmd("wezterm", { workspace = "1 silent", monitor = "0" })
    hl.exec_cmd("zen-browser", { workspace = "2 silent", monitor = "0" })
    hl.exec_cmd("vesktop", { workspace = "3 silent", monitor = "0" })
    hl.exec_cmd("wezterm", { workspace = "special silent" })
end)

-- Main config
hl.config({
    general = {
        border_size = 1,
        gaps_in = 3,
        gaps_out = 5,
        float_gaps = 0,
        gaps_workspaces = 0,

        col = {
            inactive_border = "rgba(606060aa)",
            active_border = "rgba(ffffffee)",
            nogroup_border = "rgba(606060aa)",
            nogroup_border_active = "rgba(ffffffee)",
        },

        layout = "dwindle",
        no_focus_fallback = false,
        resize_on_border = true,
        extend_border_grab_area = 15,
        hover_icon_on_border = true,
        allow_tearing = false,
        resize_corner = 0,
        modal_parent_blocking = true,
        locale = "",

        snap = {
            enabled = true,
            window_gap = 10,
            monitor_gap = 10,
            border_overlap = true,
            respect_gaps = false,
        },
    },

    decoration = {
        rounding = 8,
        rounding_power = 2.0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,
        dim_modal = true,
        dim_inactive = false,
        dim_strength = 0.1,
        dim_special = 0.25,
        dim_around = 0.4,
        screen_shader = "",
        border_part_of_window = true,

        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            ignore_opacity = true,
            new_optimizations = true,
            xray = false,
            noise = 0.0117,
            contrast = 0.8916,
            brightness = 0.8172,
            vibrancy = 0.1696,
            vibrancy_darkness = 0.0,
            special = true,
            popups = false,
            popups_ignorealpha = 0.2,
            input_methods = false,
            input_methods_ignorealpha = 0.2,
        },

        shadow = {
            enabled = false,
        },

        glow = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
        workspace_wraparound = false,
    },

    input = {
        kb_layout = "us",
        numlock_by_default = true,
        resolve_binds_by_sym = false,
        repeat_rate = 25,
        repeat_delay = 600,
        sensitivity = 0.0,
        accel_profile = "adaptive",
        force_no_accel = false,
        rotation = 0,
        left_handed = false,
        scroll_method = "2fg",
        scroll_button = 0,
        scroll_button_lock = false,
        scroll_factor = 1.0,
        natural_scroll = false,
        follow_mouse = 1,
        follow_mouse_shrink = 0,
        follow_mouse_threshold = 0.0,
        focus_on_close = 1,
        mouse_refocus = true,
        float_switch_override_focus = 1,
        special_fallthrough = false,
        off_window_axis_events = 1,
        emulate_discrete_scroll = 1,

        touchpad = {
            disable_while_typing = true,
            natural_scroll = true,
            scroll_factor = 0.8,
            middle_button_emulation = false,
            tap_button_map = "lrm",
            clickfinger_behavior = false,
            tap_to_click = true,
            drag_lock = 0,
            tap_and_drag = true,
            flip_x = false,
            flip_y = false,
            drag_3fg = 0,
        },

        touchdevice = {
            transform = 0,
            enabled = true,
        },

        virtualkeyboard = {
            share_states = 2,
            release_pressed_on_close = false,
        },
    },

    gestures = {
        workspace_swipe_distance = 300,
        workspace_swipe_touch = true,
        workspace_swipe_invert = true,
        workspace_swipe_touch_invert = false,
        workspace_swipe_min_speed_to_force = 30,
        workspace_swipe_cancel_ratio = 0.5,
        workspace_swipe_create_new = true,
        workspace_swipe_direction_lock = true,
        workspace_swipe_direction_lock_threshold = 10,
        workspace_swipe_forever = false,
        workspace_swipe_use_r = false,
        close_max_timeout = 1000,
    },

    group = {
        auto_group = true,
        insert_after_current = true,
        focus_removed_window = true,
        drag_into_group = 1,
        merge_groups_on_drag = true,
        merge_groups_on_groupbar = true,
        merge_floated_into_tiled_on_groupbar = false,
        group_on_movetoworkspace = false,

        col = {
            border_active = "rgba(ffffffee)",
            border_inactive = "rgba(606060ee)",
            border_locked_active = "rgba(ffffffee)",
            border_locked_inactive = "rgba(606060ee)",
        },

        groupbar = {
            enabled = true,
            font_family = "CaskaydiaCove Nerd Font",
            font_size = 14,
            font_weight_active = "normal",
            font_weight_inactive = "normal",
            gradients = true,
            height = 14,
            indicator_gap = 0,
            indicator_height = 3,
            stacked = false,
            priority = 3,
            render_titles = true,
            text_offset = 0,
            text_padding = 0,
            scrolling = true,
            rounding = 1,
            rounding_power = 2.0,
            gradient_rounding = 2,
            gradient_rounding_power = 2.0,
            round_only_edges = true,
            gradient_round_only_edges = true,
            text_color = "rgba(ffffffff)",

            col = {
                active = "rgba(50505080)",
                inactive = "rgba(10101080)",
                locked_active = "rgba(00000080)",
                locked_inactive = "rgba(10101080)",
            },

            gaps_in = 2,
            gaps_out = 2,
            keep_upper_gap = true,
            middle_click_close = true,
            blur = true,
        },
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_scale_notification = false,

        col = {
            splash = "rgba(ffffffff)",
        },

        font_family = "CaskaydiaCove Nerd Font",
        splash_font_family = "CaskaydiaCove Nerd Font",
        force_default_wallpaper = 0,
        vrr = 2,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        name_vk_after_proc = true,
        always_follow_on_dnd = true,
        layers_hog_keyboard_focus = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        disable_autoreload = false,
        enable_swallow = false,
        focus_on_activate = false,
        mouse_move_focuses_monitor = true,
        allow_session_lock_restore = false,
        session_lock_xray = false,
        background_color = "rgb(111111)",
        close_special_on_empty = true,
        on_focus_under_fullscreen = 2,
        exit_window_retains_fullscreen = false,
        initial_workspace_tracking = 1,
        middle_click_paste = true,
        render_unfocused_fps = 15,
        disable_xdg_env_checks = false,
        disable_hyprland_guiutils_check = false,
        lockdead_screen_delay = 1000,
        enable_anr_dialog = true,
        anr_missed_pings = 5,
        size_limits_tiled = false,
        disable_watchdog_warning = false,
    },

    layout = {
        single_window_aspect_ratio = { 0, 0 },
        single_window_aspect_ratio_tolerance = 0.1,
    },

    binds = {
        pass_mouse_when_bound = false,
        scroll_event_delay = 300,
        workspace_back_and_forth = false,
        hide_special_on_workspace_change = false,
        allow_workspace_cycles = false,
        workspace_center_on = 0,
        focus_preferred_method = 0,
        ignore_group_lock = false,
        movefocus_cycles_fullscreen = true,
        movefocus_cycles_groupfirst = false,
        window_direction_monitor_fallback = true,
        disable_keybind_grabbing = false,
        allow_pin_fullscreen = false,
        drag_threshold = 0,
    },

    xwayland = {
        enabled = true,
        use_nearest_neighbor = true,
        force_zero_scaling = true,
        create_abstract_socket = false,
    },

    opengl = { nvidia_anti_flicker = true },

    render = {
        direct_scanout = 2,
        expand_undersized_textures = true,
        xp_mode = false,
        ctm_animation = 2,
        cm_enabled = true,
        send_content_type = true,
        cm_auto_hdr = 1,
        new_render_scheduling = false,
        non_shader_cm = 2,
        non_shader_cm_interop = 2,
        cm_sdr_eotf = "default",
        commit_timing_enabled = true,
        use_fp16 = 2,
        keep_unmodified_copy = 2,
        use_shader_blur_blend = false,
    },

    cursor = {
        invisible = false,
        sync_gsettings_theme = true,
        no_hardware_cursors = 2,
        no_break_fs_vrr = 2,
        min_refresh_rate = 48,
        hotspot_padding = 1,
        inactive_timeout = 0,
        no_warps = false,
        persistent_warps = false,
        warp_on_change_workspace = 0,
        warp_on_toggle_special = 0,
        zoom_factor = 1.0,
        zoom_rigid = false,
        zoom_detached_camera = true,
        enable_hyprcursor = true,
        hide_on_key_press = false,
        hide_on_touch = true,
        hide_on_tablet = true,
        use_cpu_buffer = 2,
        warp_back_after_non_mouse_input = false,
        zoom_disable_aa = false,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
        enforce_permissions = true,
    },

    quirks = { prefer_hdr = 1 },

    dwindle = {
        force_split = 0,
        preserve_split = false,
        smart_split = false,
        smart_resizing = true,
        permanent_direction_override = false,
        special_scale_factor = 0.8,
        split_width_multiplier = 1.0,
        use_active_for_splits = true,
        default_split_ratio = 1.0,
        split_bias = 0,
        precise_mouse_move = false,
    },
})

-- Animations
hl.curve("overshoot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "overshoot" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "smoothIn" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 3, bezier = "smoothIn" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "default" })

-- Device settings
hl.device({ name = "logitech-usb-receiver", accel_profile = "flat" })
hl.device({ name = "logitech-pro-x-1", accel_profile = "flat" })

-- Gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "up", mods = "SUPER", action = "fullscreen" })
hl.gesture({ fingers = 2, direction = "pinch", mods = "SUPER", action = "cursorZoom", zoom_level = 1, mode = "live" })

-- Permissions
hl.permission({ binary = "/usr/bin/hyprlock", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })

-- Layer rules
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

-- Window rules
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Zen browser
hl.window_rule({
    name = "zen_opacity",
    match = { class = "zen" },
    opacity = 1.0,
})
hl.window_rule({
    name = "zen_file_upload",
    match = {
        class = "zen",
        title = "File Upload",
    },
    float = true,
    center = true,
    size = { "monitor_w * 0.5", "monitor_h * 0.5" },
})
hl.window_rule({
    name = "zen_picture_in_picture",
    match = {
        class = "zen",
        title = "Picture-in-Picture",
    },
    float = true,
    pin = true,
    move = { "monitor_w * 0.695", "monitor_h * 0.68" },
    size = { "monitor_w * 0.3", "monitor_h * 0.3" },
})

-- Thunar
hl.window_rule({ match = { class = "thunar" }, opacity = 0.8 })

-- blueman-manager
hl.window_rule({ match = { class = "blueman-manager" }, opacity = 0.8 })

-- pavucontrol
hl.window_rule({ match = { class = "pavucontrol" }, opacity = 0.8 })

-- imv
hl.window_rule({ match = { class = "imv" }, opacity = 0.8 })

-- zathura
hl.window_rule({ match = { class = "org.pwmt.zathura" }, opacity = 0.8 })

-- Steam
hl.window_rule({ match = { class = "steam" }, center = true })
hl.window_rule({
    match = {
        class = "steam",
        title = "Friends List",
    },
    float = true,
})
hl.window_rule({
    match = {
        class = "steam",
        title = "Steam - News",
    },
    float = true,
})
hl.window_rule({
    match = {
        class = "steam",
        title = "Steam Settings",
    },
    float = true,
})
hl.window_rule({
    match = {
        class = "steam",
        title = "Special Offers",
    },
    float = true,
})

-- xdg-desktop-portal-gtk
hl.window_rule({
    name = "xdg_desktop_portal_file_dialog",
    match = {
        class = "xdg-desktop-portal-gtk",
    },
    float = true,
    center = true,
    size = { "monitor_w * 0.5", "monitor_h * 0.5" },
})
-- hl.window_rule({
--     match = {
--         class = "xdg-desktop-portal-gtk",
--         title = "^(Open File|Open Files|All Files|Save As|Save File)",
--     },
--     float = true,
--     center = true,
--     size = { "monitor_w * 0.5", "monitor_h * 0.5" },
-- })

-- vscode
hl.window_rule({ match = { class = "code-url-handler" }, opacity = 0.8 })

-- vesktop
hl.window_rule({ match = { class = "vesktop" }, opacity = 0.8, workspace = "3 silent" })

-- xwayland screenshare
hl.window_rule({
    name = "xwayland-video-bridge-fixes",
    match = {
        class = "xwaylandvideobridge",
    },
    opacity = "0.0 override",
    no_anim = true,
    no_blur = true,
    no_initial_focus = true,
    no_focus = true,
    max_size = { 1, 1 },
})
