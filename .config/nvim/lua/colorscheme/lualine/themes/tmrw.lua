local colors = require("colorscheme.tmrw.colors")

return {
    normal = {
        a = { bg = colors.blue, fg = colors.black, gui = "bold" },
        b = { bg = colors.selection, fg = colors.fg },
        c = { bg = colors.selection, fg = colors.fg },
    },
    insert = {
        a = { bg = colors.green, fg = colors.black, gui = "bold" },
        b = { bg = colors.selection, fg = colors.fg },
        c = { bg = colors.selection, fg = colors.fg },
    },
    visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = { bg = colors.selection, fg = colors.fg },
        c = { bg = colors.selection, fg = colors.fg },
    },
    replace = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
        b = { bg = colors.selection, fg = colors.fg },
        c = { bg = colors.selection, fg = colors.fg },
    },
    command = {
        a = { bg = colors.orange, fg = colors.black, gui = "bold" },
        b = { bg = colors.selection, fg = colors.fg },
        c = { bg = colors.selection, fg = colors.fg },
    },
    inactive = {
        a = { bg = colors.selection, fg = colors.fg, gui = "bold" },
        b = { bg = colors.selection, fg = colors.fg },
        c = { bg = colors.selection, fg = colors.fg },
    },
}
