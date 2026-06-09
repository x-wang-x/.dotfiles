local colors = require("modules.themes.matugen_colors")
hl.config({
    general = {
        gaps_in          = 4,
        gaps_out         = 2,
        border_size      = 2,
        col              = {
            active_border   = { colors = { colors.primary, colors.secondary }, angle = 45 },
            inactive_border = colors.on_primary,
        },

        resize_on_border = true,
        allow_tearing    = true,
        layout           = "dwindle",
    },
    --Layout
    dwindle = {
        preserve_split = true, -- You probably want this
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },
    -- Decoration
    decoration = {
        rounding         = 10,
        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        blur             = {
            enabled = true,
            size = 1,
            passes = 3,
        },

    },

    animations = {
        enabled = true,
    },

    misc = {
        focus_on_activate = true -- Auto focus on just actived window
    }

})

-- Curve
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
-- Spring
hl.curve("rubber", { type = "spring", mass = 1, stiffness = 70, dampening = 10 })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1, spring = "easy", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1, spring = "easy", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

---- Set smart-gaps on window
--This set gap to 0  when only tiled window visible
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
--This set gap to 0 when window is maximized fullscreen
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

---- Set smart-border on window
-- This remove border on tiled window if visible window is only one
hl.window_rule({
    name        = "no-gaps-wtv1",
    match       = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
})
-- set no border if window is maximized fullscreen
hl.window_rule({
    name        = "no-gaps-f1",
    match       = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
})
