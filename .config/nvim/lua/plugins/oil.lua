return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require("oil")

        oil.setup({
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                ["q"] = { "actions.close" },
            },
        })

        vim.keymap.set("n", "<C-f>", oil.toggle_float, { desc = "Toggle floating window" })
    end,
}
