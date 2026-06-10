require('modules.env')
require('modules.monitors')
require('modules.autostart')
require('modules.decoration')
require('modules.keybinds')

hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_rules     = "",
        kb_options   = "caps:escape",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad     = {
            natural_scroll = true,
        },
    },
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Ignore maximize requests from all apps
local suppressMaximizeRule = hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

-- Fix some dragging issues with XWayland
hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})
