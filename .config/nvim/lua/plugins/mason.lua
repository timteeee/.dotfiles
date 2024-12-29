return {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = { border = "rounded" },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "lua-language-server",
                "gopls",
                "goimports",
                "basedpyright",
                "typescript-language-server",
                "astro-language-server",
                "html-lsp",
                "tailwindcss-language-server",
                "dockerfile-language-server",
                "docker-compose-language-service",
                "biome",
                "prettier",
                "stylua",
                "eslint_d",
                "ruff",
                "hadolint",
                "bash-language-server",
                "shellcheck",
            },
        })
    end,
}
