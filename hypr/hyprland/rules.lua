-- ######## Window rules ########
-- ######## Window rules ########



-- Discord web
hl.window_rule({
    match = {
        class = "^(discord-web)$",
    },
    border_size = 0,
})

hl.window_rule({
    match = {
        class = "^(discord-web)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        class = "^(discord-web)$",
    },
    float = true,
})

-- Kitty opacity
-- hl.window_rule({
--     match = {
--         tag = "kitty",
--     },
--     opacity = "0.1",
-- })

-- Global opacity
-- hl.window_rule({
--     match = {
--         title = ".*",
--     },
--     opacity = "1 override 1 override 1 override",
-- })

-- Floating
hl.window_rule({
    match = {
        class = "^(blueberry\\.py)$",
    },
    float = true,
})

-- Steam floating rule was commented out in your old config,
-- so it remains disabled.
-- hl.window_rule({
--     match = {
--         class = "^(steam)$",
--     },
--     float = true,
-- })

hl.window_rule({
    match = {
        class = "^(guifetch)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(pavucontrol)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(pavucontrol)$",
    },
    size = "45% 45%",
})

hl.window_rule({
    match = {
        class = "^(pavucontrol)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        class = "^(org.pulseaudio.pavucontrol)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(org.pulseaudio.pavucontrol)$",
    },
    size = "45% 45%",
})

hl.window_rule({
    match = {
        class = "^(org.pulseaudio.pavucontrol)$",
    },
    center = true,
})

hl.window_rule({
    match = {
        class = "^(nm-connection-editor)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(nm-connection-editor)$",
    },
    size = "45% 45%",
})

hl.window_rule({
    match = {
        class = "^(nm-connection-editor)$",
    },
    center = true,
})

-- Steam empty-title popup
hl.window_rule({
    match = {
        class = "^(steam)$",
        title = "^$",
    },
    stay_focused = true,
})

hl.window_rule({
    match = {
        class = "^(steam)$",
        title = "^$",
    },
    min_size = "1 1",
})

-- Tiling
hl.window_rule({
    match = {
        class = "^dev\\.warp\\.Warp$",
    },
    tile = true,
})

-- Picture-in-Picture
hl.window_rule({
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
    },
    keep_aspect_ratio = true,
})

hl.window_rule({
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
    },
    move = "73% 72%",
})

hl.window_rule({
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
    },
    size = "25% 25%",
})

hl.window_rule({
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
    },
    pin = true,
})

-- Dialog windows
local dialog_titles = "^(Open File|Select a File|Choose wallpaper|Open Folder|Save As|Library|File Upload)(.*)$"

hl.window_rule({
    match = {
        title = dialog_titles,
    },
    center = true,
})

hl.window_rule({
    match = {
        title = dialog_titles,
    },
    float = true,
})

-- Dolphin file dialogs
hl.window_rule({
    match = {
        class = "^(org\\.kde\\.dolphin)$",
        title = "^(Open|Save|Select|Choose)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(org\\.kde\\.dolphin)$",
        title = "^(Open|Save|Select|Choose)(.*)$",
    },
    stay_focused = true,
})

hl.window_rule({
    match = {
        class = "^(org\\.kde\\.dolphin)$",
        title = "^(Open|Save|Select|Choose)(.*)$",
    },
    pin = true,
})

-- Thunar file dialogs
hl.window_rule({
    match = {
        class = "^(Thunar)$",
        title = "^(Open|Save|Select|Choose)(.*)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(Thunar)$",
        title = "^(Open|Save|Select|Choose)(.*)$",
    },
    stay_focused = true,
})

hl.window_rule({
    match = {
        class = "^(Thunar)$",
        title = "^(Open|Save|Select|Choose)(.*)$",
    },
    pin = true,
})

-- Tearing
hl.window_rule({
    match = {
        title = ".*\\.exe",
    },
    immediate = true,
})

hl.window_rule({
    match = {
        class = "^(steam_app)",
    },
    immediate = true,
})

-- ######## Workspace rules ########
hl.workspace_rule({
    workspace = "special:special",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special2",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special3",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special4",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special5",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special6",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special7",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special8",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special9",
    gaps_out = 100,
    gaps_in = 10,
})

hl.workspace_rule({
    workspace = "special:special99",
    gaps_out = 200,
    gaps_in = 10,
})

hl.window_rule({
    match = {
        class = "^(com\\.obsproject\\.Studio)$",
    },
    workspace = "special:special5 silent",
})

hl.window_rule({
    match = {
        class = "^(steam)$",
    },
    workspace = "special:special99 silent",
})

hl.window_rule({
    match = {
        class = "^(steam)$",
        title = "^$",
        xwayland = true,
    },
    pin = true,
})
