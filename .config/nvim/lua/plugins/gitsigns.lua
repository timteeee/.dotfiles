return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        signs_staged = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            vim.keymap.set("n", "[h", function()
                ---@diagnostic disable-next-line: param-type-mismatch
                gitsigns.nav_hunk("prev")
            end, { buffer = bufnr, desc = "Go to Previous Hunk" })
            vim.keymap.set("n", "]h", function()
                ---@diagnostic disable-next-line: param-type-mismatch
                gitsigns.nav_hunk("next")
            end, { buffer = bufnr, desc = "Go to Next Hunk" })
            vim.keymap.set("n", "[H", function()
                ---@diagnostic disable-next-line: param-type-mismatch
                gitsigns.nav_hunk("first")
            end, { buffer = bufnr, desc = "Go to First Hunk" })
            vim.keymap.set("n", "]H", function()
                ---@diagnostic disable-next-line: param-type-mismatch
                gitsigns.nav_hunk("last")
            end, { buffer = bufnr, desc = "Go to Last Hunk" })
        end,
    },
}
