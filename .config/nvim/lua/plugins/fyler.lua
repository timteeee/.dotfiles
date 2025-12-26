return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    branch = "stable", -- Use stable branch for production
    lazy = false, -- Necessary for `default_explorer` to work properly
    opts = {
        integrations = {
            icon = "nvim_web_devicons",
        },
    },
    keys = {
        {
            "<C-f>",
            function()
                require("fyler").toggle({ kind = "split_right_most" })
            end,
            desc = "Toggle Fyler sidebar",
        },
    },
}
