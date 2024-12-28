return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format" },
                go = { "goimports", "gofmt" }, -- Conform will run multiple formatters sequentially
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                astro = { lsp_format = "prefer" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
            },
            -- These options will be passed to conform.format()
            format_on_save = function(bufnr)
                if vim.b[bufnr].disable_autofmt or vim.g.disable_autofmt then
                    return
                end

                return { timeout_ms = 500, async = false, lsp_fallback = true }
            end,
        })

        vim.api.nvim_create_user_command("ToggleFmt", function(args)
            if args.bang then
                local disabled = not vim.g.disable_autofmt
                vim.g.disable_autofmt = disabled
                local status = disabled and "disabled" or "enabled"
                vim.notify("Format on save " .. status .. " globally")
            else
                local disabled = not vim.b.disable_autofmt
                vim.b.disable_autofmt = disabled
                local status = disabled and "disabled" or "enabled"
                vim.notify("Format on save " .. status .. " for current buffer")
            end
        end, {
            desc = "Toggle format on save for current buffer. Call with ! to toggle globally.",
            bang = true,
        })

        require("conform").formatters.rustfmt = {
            options = {
                -- The default edition of Rust to use when no Cargo.toml file is found
                default_edition = "2021",
            },
        }
    end,
}
