return {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    opts = {
        scope = "git_branch",
        icons = true,
        status = false,
    },
    keys = {
        { "<leader>g", "<CMD>Grapple toggle<CR>", desc = "Tag a file" },
        { "<C-g>", "<CMD>Grapple toggle_tags<CR>", desc = "Toggle tags menu" },
        { "<C-n>", "<CMD>Grapple cycle_tags next<CR>", desc = "Go to next tag" },
        { "<C-p>", "<CMD>Grapple cycle_tags prev<CR>", desc = "Go to previous tag" },
    },
}
