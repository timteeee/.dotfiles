return {
    "Vimjas/vim-python-pep8-indent",
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        ft = "python",
        keys = {
            { "gsv", "<cmd>VenvSelect<cr>" },
        },
        opts = {},
    },
}
