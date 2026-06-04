local terminal    = "kitty"
local fileManager = "nemo"
local menu        = "rofi -show drun"
local browser     = "librewolf"

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier
local nav_up      = "K"
local nav_down    = "J"
local nav_left    = "H"
local nav_right   = "L"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())
closeWindowBind:set_enabled(true)
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + " .. nav_left, hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. nav_right, hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. nav_up, hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. nav_down, hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + CTRL +" .. nav_right, hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
    { repeating = true })
hl.bind(mainMod .. " + CTRL +" .. nav_left, hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
    { repeating = true })
hl.bind(mainMod .. " + CTRL +" .. nav_down, hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
    { repeating = true })
hl.bind(mainMod .. " + CTRL +" .. nav_up, hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
--     { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
--     { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshot
-- Require grim,slurp, and swappy
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(mainMod .. "+ Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Speaker / headphone switcher for ryzen laptop
---- this is specific workaround for my laptop advan workplus
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("amixer -c 1 sset Master 5%+ >/dev/null 2>&1"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("amixer -c 1 sset Master 5%- >/dev/null 2>&1"),
    { locked = true, repeating = true })

local function toggle_hardware_audio()
    local handle = io.popen("amixer -c 1 sget Speaker 2>/dev/null")
    if not handle then return end
    local amixer_output = handle:read("*a")
    handle:close()
    local is_speaker_muted = amixer_output:find("%[off%]")

    if is_speaker_muted then
        os.execute("amixer -c 1 sset Speaker 100% unmute >/dev/null 2>&1")
        os.execute("amixer -c 1 sset Headphone 0% >/dev/null 2>&1")
        print("Audio routed to Laptop Speakers (Headphones Muted)")
    else
        os.execute("amixer -c 1 sset Speaker mute >/dev/null 2>&1")
        os.execute("amixer -c 1 sset Headphone 100% >/dev/null 2>&1")
        print("Audio routed to Headphones (Speakers Muted)")
    end
end
hl.bind(mainMod .. " + ALT + A", function()
    toggle_hardware_audio()
end, { description = "Toggle hardware audio between Speakers and Headphones" })
