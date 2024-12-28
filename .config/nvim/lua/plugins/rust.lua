return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        ft = { "rust" },
        config = function()
            local handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
            }
            vim.g.rustaceanvim = {
                tools = {},
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", "<leader>xp", "<CMD>RustLsp expandMacro<CR>", { buffer = bufnr, desc = "E[xp]and Macro" })
                        vim.keymap.set("n", "<leader>rp", "<CMD>RustLsp rebuildProcMacros<CR>", { buffer = bufnr, desc = "[R]ebuild [P]roc Macros" })
                        vim.keymap.set("n", "<leader>rs", "<CMD>RustAnalyzer restart<CR>", { buffer = bufnr, desc = "Rust Analyzer [R]e[s]tart" })
                    end,
                    handlers = handlers,
                },
            }
        end,
    },
    {
        "saecki/crates.nvim",
        event = "BufRead Cargo.toml",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("crates").setup({})
        end,
    },
}
