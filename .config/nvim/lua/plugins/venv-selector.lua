return {
    "linux-cultist/venv-selector.nvim",
    -- REQUIRED: `fd` must be installed on the system
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
        -- "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional, only for debugger support
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
        require("venv-selector").setup()
    end,
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>" },
    },
}
