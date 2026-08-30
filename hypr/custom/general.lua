-- Put general config stuff here
-- Variable reference: https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
    input = {
        kb_layout = "de,us",
        kb_options = "caps:escape",
        touchpad = {
            disable_while_typing = false,
            natural_scroll = true,
            scroll_factor = 0.15,
            tap_and_drag = true,
        },
    },
    xwayland = {
        force_zero_scaling = true,
        use_nearest_neighbor = true,
    },
    general = {
        gaps_in = 3,
        col = {
            active_border = "rgba(ffffff33)",
            inactive_border = "rgba(ffffff1a)",
        },
        border_size = 1,
    },
    decoration = {
        blur = {
            enabled = true,
            size = 8,
            passes = 2,
            -- new_optimizations = true,
            -- ignore_opacity = true,
            -- xray = false,
        },
    },
    group = {
        auto_group = false,
	groupbar = {
	    enabled = false,
	},
	col = {
	    border_active = "rgba(ffffff33)",
	    border_inactive = "rgba(ffffff1a)",
	}
    },
})

hl.env("GDK_SCALE", "1.25")
hl.env("XCURSOR_SIZE", "32")

-- Main monitor gets workspaces 1-5
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })

-- Second monitor gets workspaces 6-10
hl.workspace_rule({ workspace = "6", monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "7", monitor = "DP-3" })
hl.workspace_rule({ workspace = "8", monitor = "DP-3" })
hl.workspace_rule({ workspace = "9", monitor = "DP-3" })
hl.workspace_rule({ workspace = "10", monitor = "DP-3" })

hl.window_rule({
    name = "global-opacity",
    match = { class = "^(.*)$" },
    opacity = "0.89 override 0.89 override",
})

hl.window_rule({
    name  = "vivaldi-no-autogroup",
    match = { initial_class = "^(vivaldi)$" },
    group = "deny",
})

hl.window_rule({
    name = "figma-opacity",
    match = { title = "^(.*Figma.*)$" },
    opacity = "1.0 1.0",
})
