return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
        { "Bilal2453/luvit-meta", lazy = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local diagnostic_signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

        for type, icon in pairs(diagnostic_signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        require("lspconfig.ui.windows").default_options.border = "rounded"

        vim.diagnostic.config({
            float = { border = "rounded", source = true },
        })

        -- LSP Related Keybinds
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("LspKeybinds", { clear = true }),
            callback = function(event)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "[R]e[n]ame" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "[C]ode [A]ction" })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "[G]oto [D]efinition" })
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = event.buf, desc = "[G]oto [R]eferences" })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = event.buf, desc = "[G]oto [I]mplementation" })
                vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, { buffer = event.buf, desc = "[T]ype [D]efinition" })
                vim.keymap.set("n", "<leader>rs", "<CMD>LspRestart<CR>", { buffer = event.buf, desc = "LSP [R]e[s]tart" })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover Documentation" })
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = event.buf, desc = "Signature Documentation" })
                vim.keymap.set("n", "<leader>ih", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end, { desc = "Toggle LSP Inlay Hints" })
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local lsp_capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

        local handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
        }

        require("mason-lspconfig").setup_handlers({
            -- Default handler for all servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = lsp_capabilities,
                    handlers = handlers,
                })
            end,

            lua_ls = function()
                lspconfig.lua_ls.setup({
                    capabilities = lsp_capabilities,
                    handlers = handlers,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                                disable = { "missing-fields" },
                            },
                            workspace = {
                                library = { vim.env.VIMRUNTIME },
                            },
                        },
                    },
                })
            end,
        })

        -- Start of configurations not managed by Mason
        -- Rust Analyzer is installed with Rustup and initialized with https://github.com/mrcjkb/rustaceanvim

        -- Part of the Gleam binary
        lspconfig.gleam.setup({
            capabilities = lsp_capabilities,
            handlers = handlers,
        })

        -- Installed with ZVM and matched to the compiler version being used
        lspconfig.zls.setup({
            capabilities = lsp_capabilities,
            handlers = handlers,
        })
    end,
}
