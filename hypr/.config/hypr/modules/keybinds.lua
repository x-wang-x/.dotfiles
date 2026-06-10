local terminal    = "foot"
local fileManager = "nemo"
local menu        = "rofi"
local browser     = "librewolf"

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier
local nav_up      = "K"
local nav_down    = "J"
local nav_left    = "H"
local nav_right   = "L"

hl.bind("SUPER + Tab", function()
        hl.dispatch(hl.dsp.window.cycle_next()) -- Change focus to another window
        hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
    end,
    { description = "Cycle window" })

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("theme-interface"), { description = "Open theme switcher" })
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())
closeWindowBind:set_enabled(true)
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
    { description = "Lock" })
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("toggle-waybar"), { release = true, description = "Toggle Waybar" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open file manager" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Open browser" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle float window" })
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("pkill " .. menu .. " || " .. menu .. " -show drun"),
    { description = "Toggle menu", release = true })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Pseudo window" })
hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit"), { description = "Toogle dwindle split" }) -- dwindle only

-- Move focus with mainMod + Direction
hl.bind(mainMod .. " + " .. nav_left, hl.dsp.focus({ direction = "left" }), { description = "Focus left" })
hl.bind(mainMod .. " + " .. nav_right, hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mainMod .. " + " .. nav_up, hl.dsp.focus({ direction = "up" }), { description = "Focus up" })
hl.bind(mainMod .. " + " .. nav_down, hl.dsp.focus({ direction = "down" }), { description = "Focus down" })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Focus to workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }),
        { description = "Move window to workspace " .. i })
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll workspace down" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll workspace up" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Drag window", mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize with mouse", mouse = true })

hl.bind(mainMod .. " + CTRL +" .. nav_right, hl.dsp.window.resize({ x = 10, y = 0, relative = true }),
    { repeating = true, description = "Resize +x" })
hl.bind(mainMod .. " + CTRL +" .. nav_left, hl.dsp.window.resize({ x = -10, y = 0, relative = true }),
    { repeating = true, description = "Resize -x" })
hl.bind(mainMod .. " + CTRL +" .. nav_down, hl.dsp.window.resize({ x = 0, y = 10, relative = true }),
    { repeating = true, description = "Resize +y" })
hl.bind(mainMod .. " + CTRL +" .. nav_up, hl.dsp.window.resize({ x = 0, y = -10, relative = true }),
    { repeating = true, description = "Resize -y" })

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
--     { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
--     { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true, description = "Mute/Unmute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true, description = "Mute/Unmute Mic" })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true, description = "Increase brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true, description = "Decrease brightness" })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Play-Next" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play-Pause" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play-Pause" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Play-Previous" })

-- Screenshot
-- Require grim,slurp, and swappy
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'), { description = "Screenshot" })
hl.bind(mainMod .. "+ Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'),
    { description = "Screenshot and copy to clipboard" })

---- Speaker / headphone switcher for ryzen laptop
--- This is specific workaround for my laptop, maybe not for every soundcard need this
--- My soundcard basically it doesnt allow play with speaker when jack inputed
-- raise volume master, cause output is always 100% regardless jack or speaker
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("amixer -c 1 sset Master 5%+ >/dev/null 2>&1"),
    { locked = true, repeating = true, description = "Increase master volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("amixer -c 1 sset Master 5%- >/dev/null 2>&1"),
    { locked = true, repeating = true, description = "Decrease master volume" })

local function toggle_hardware_audio()
    local handle = io.popen("amixer -c 1 sget Speaker 2>/dev/null")
    if not handle then return end
    local amixer_output = handle:read("*a")
    handle:close()
    local is_speaker_muted = amixer_output:find("%[off%]")
    -- Unmute speaker and lower jack output volume to 0
    if is_speaker_muted then
        os.execute("amixer -c 1 sset Speaker 100% unmute >/dev/null 2>&1")
        os.execute("amixer -c 1 sset Headphone 0% >/dev/null 2>&1")
        -- Mute speaker and raise the jack volume 100%
    else
        os.execute("amixer -c 1 sset Speaker mute >/dev/null 2>&1")
        os.execute("amixer -c 1 sset Headphone 100% >/dev/null 2>&1")
    end
end
hl.bind(mainMod .. " + ALT + A", function()
    toggle_hardware_audio()
end, { description = "Toggle hardware audio between Speakers and Headphones" })
