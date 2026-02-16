return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        { "mason-org/mason.nvim", opts = {} },
    },
    config = function()
        -- these names need to match filenames found in lspconfig
        -- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
        local lsp_servers = {
            "lua_ls",
            "basedpyright",
            "ruff",
            "gopls",
            "ts_ls",
            "astro",
            "html",
            "tailwindcss",
            "docker_language_server",
            "bashls",
        }

        -- these names need to match names found in the Mason registry
        -- https://github.com/mason-org/mason-registry/tree/main/packages
        local non_lsp_tools = {
            "stylua",
            "gofumpt",
            "goimports",
            "biome",
            "prettier",
            "prettierd",
            "oxlint",
            "eslint_d",
            "hadolint",
            "shellcheck",
        }

        require("mason-lspconfig").setup({
            ensure_installed = lsp_servers,
        })

        local registry = require("mason-registry")

        local ensure_installed = function()
            for _, tool in ipairs(non_lsp_tools) do
                if not registry.is_installed(tool) then
                    local ok, package = pcall(registry.get_package, tool)
                    if ok then
                        vim.notify("[mason.nvim] Installing " .. tool)

                        package:install(nil, function(success, err_or_receipt)
                            vim.schedule(function()
                                if success then
                                    vim.notify("[mason.nvim] " .. tool .. " installed")
                                else
                                    vim.notify("[mason.nvim] " .. tool .. " unable to be installed:\n" .. tostring(err_or_receipt), vim.log.levels.ERROR)
                                end
                            end)
                        end)
                    else
                        vim.notify("[mason.nvim] " .. tool .. " not found", vim.log.levels.ERROR)
                    end
                end
            end
        end

        registry.refresh(ensure_installed)
    end,
}
