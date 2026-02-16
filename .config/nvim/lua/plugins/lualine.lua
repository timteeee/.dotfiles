return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            globalstatus = true,
            icons_enabled = true,
            theme = require("colorscheme.lualine.themes.tmrw"),
            section_separators = "",
            component_separators = "",
        },
        sections = {
            lualine_b = { { "branch", icon = "" } },
            lualine_c = { { "filename", path = 1 } }, -- relative from the directory nvim was opened in
            lualine_x = { "diagnostics" },
            lualine_y = { "filetype" },
        },
    },
}
