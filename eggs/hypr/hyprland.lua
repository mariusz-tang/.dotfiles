-- Monitors.
-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080@144",
})

-- Autostart.
-- See https://wiki.hypr.land/configuring/core/autostart/
hl.on("hyprland.start", function()
  hl.exec_cmd("wl-clip-persist --clipboard regular")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("ashell")

  hl.exec_cmd("ssh-agent -D -a ${SSH_AUTH_SOCK} -t 30m")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  hl.exec_cmd("webcord")

  hl.exec_cmd("foot --server")
end)

-- Environment variables.
-- See https://wiki.hypr.land/configuring/core/environment-variables/
hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")

-- Use columns only so windows can always be navigated with left and right (J and K).
hl.layout.register("columns", {
  recalculate = function(ctx)
    local n = #ctx.targets
    if n == 0 then
      return
    end

    for i, target in ipairs(ctx.targets) do
      target:place(ctx:column(i, n))
    end
  end,
})

-- Look and feel.
-- Refer to https://wiki.hypr.land/configuring/core/config-options/
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    gaps_workspaces = 20,

    border_size = 0,

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,

    -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
    allow_tearing = false,

    layout = "lua:columns",
  },

  decoration = {
    rounding = 10,
    rounding_power = 4,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1.0,
    inactive_opacity = 0.7,

    shadow = { enabled = true },

    blur = {
      enabled = true,
      size = 3,
      passes = 4,
    },
    motion_blur = { enabled = true },
  },

  animations = {
    enabled = true,
  },
})

-- Default curves and animations, see https://wiki.hypr.land/configuring/core/animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs.
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, damping = 24.21279333 })

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
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/
hl.config({
  dwindle = {
    force_split = 2, -- Always split to the right.
    preserve_split = true, -- You probably want this
  },
})

-- Miscellaneous.
hl.config({
  misc = {
    allow_session_lock_restore = true,
    force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
    font_family = "FiraCode Nerd Font Mono",
  },
})

-- Layers.
hl.config({
  layers = {
    allow_new_top_layers_over_existing_fullscreen = true, -- Set to false to make newly mapped top layers render below existing covering fullscreen window
  },
})

-- Input.
hl.config({
  input = {
    kb_layout = "gb,pl",
    kb_variant = "",
    kb_model = "acer_laptop",
    kb_options = "ctrl:swapcaps,compose:menu,grp:shifts_toggle",
    kb_rules = "",

    follow_mouse = 1,
    accel_profile = "flat",

    touchpad = {
      natural_scroll = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

-- Keybinds.
-- See https://wiki.hypr.land/configuring/core/binds/
hl.config({
  binds = {
    workspace_back_and_forth = 1,
  },
})

local mod = "SUPER"

hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(
  mod .. " + O",
  hl.dsp.exec_cmd("rofi -modes drun,run -show drun \
        -drun-match-fields name,categories,generic -sort -drun-display-format {name}")
)
hl.bind(mod .. " + U", hl.dsp.exec_cmd("utilities"))
hl.bind(mod .. " + return", hl.dsp.exec_cmd("common-apps"))
hl.bind(mod .. " + slash", hl.dsp.exec_cmd("power-menu"))

-- Save screenshot and copy to clipboard.
hl.bind("print", hl.dsp.exec_cmd("screenshot"))
-- Save screenshot, copy to clipboard, AND open in swappy.
hl.bind(mod .. " + print", hl.dsp.exec_cmd("screenshot; wl-paste | swappy -f -"))

hl.bind(mod .. " + F", hl.dsp.window.fullscreen())

-- Move focus with mainMod + arrow keys
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- Special keybinds for workspace 5 to make it easier to reach with one hand.
hl.bind(mod .. " + GRAVE", hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + SHIFT + GRAVE", hl.dsp.window.move({ workspace = 5 }))

-- Move workspace to other monitor.
hl.bind(mod .. " + SHIFT + N", function()
  if hl.get_active_workspace().monitor.name == "eDP-1" then
    hl.dispatch(hl.dsp.workspace.move({ monitor = "HDMI-A-1" }))
  else
    hl.dispatch(hl.dsp.workspace.move({ monitor = "eDP-1" }))
  end
end)

-- Move/resize windows with mainMod + LMB/RMB and dragging.
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("ashell msg volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("ashell msg volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("ashell msg volume-toggle-mute"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("ashell msg brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("ashell msg brightness-down"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Toggle expensive effects to save on battery power.
hl.bind("SUPER + F1", function()
  local game_mode = (hl.get_config("animations.enabled") == false)

  if game_mode then
    hl.exec_cmd("hyprctl reload")
    return
  end

  hl.config({
    general = {
      gaps_in = 0,
      gaps_out = 0, -- Disable gaps
      border_size = 0,
    },

    animations = {
      enabled = false, -- Disable animations
    },

    -- Disable blur, shadow and window rounding
    decoration = {
      shadow = { enabled = false },
      blur = { enabled = false },
      rounding = 0,
    },
  })
end)

-- Windows and workspaces.
-- See https://wiki.hypr.land/configuring/core/rules/
hl.window_rule({ match = { class = "^zen$" }, workspace = 2 })
hl.window_rule({ match = { class = "^webcord$" }, workspace = 3 })
hl.window_rule({ match = { class = "^spotify|Spotify$" }, workspace = 4 })
hl.window_rule({ match = { class = "^steam$" }, workspace = 5 })

hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1" })

hl.window_rule({
  -- Ignore maximize requests from all apps.
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  -- Fix some dragging issues with XWayland.
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

-- Hyprland-run windowrule.
hl.window_rule({
  name = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move = "20 monitor_h-120",
  float = true,
})
