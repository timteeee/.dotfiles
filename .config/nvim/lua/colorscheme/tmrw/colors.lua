local palette = {
    fg = "#c5c8c6",
    fg_dim = "#969896",
    fg_dark = "#4d5057",
    bg = "#1d1f21",
    bg_bright = "#373b41",
    red = "#cc6666",
    orange = "#de935f",
    yellow = "#f0c674",
    green = "#b5bd68",
    blue = "#81a2be",
    cyan = "#8abeb7",
    purple = "#b294bb",
    black = "#000000",
    white = "#ffffff",
}

---@class Colors
local colors = {
    fg = palette.fg,
    fg_dim = palette.fg_dim,
    fg_dark = palette.fg_dark,
    bg = palette.bg,
    bg_bright = palette.bg_bright,
    red = palette.red,
    orange = palette.orange,
    yellow = palette.yellow,
    green = palette.green,
    blue = palette.blue,
    cyan = palette.cyan,
    purple = palette.purple,
    black = palette.black,
    white = palette.white,
    comment = palette.fg_dim,
    selection = palette.bg_bright,
    gutter = {
        fg = palette.fg_dark,
        bg = palette.bg,
    },
    diff = {
        add = palette.green,
        change = palette.cyan,
        delete = palette.red,
        text = palette.fg,
    },
    git = {
        add = palette.green,
        change = palette.cyan,
        delete = palette.red,
        text = palette.fg,
        ignore = palette.fg_dark,
    },
    diagnostics = {
        error = palette.red,
        warning = palette.yellow,
        info = palette.cyan,
        hint = palette.cyan,
    },
}

return colors
