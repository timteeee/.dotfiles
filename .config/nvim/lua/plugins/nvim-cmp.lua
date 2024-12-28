return {
    "yioneko/nvim-cmp",
    branch = "perf",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip", -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "nvim-highlight-colors",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        cmp.setup({
            window = {
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            }),
            sources = {
                {
                    name = "nvim_lsp",
                    entry_filter = function(entry, _)
                        local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
                        return kind ~= "Text" or kind ~= "Keyword"
                    end,
                }, -- lsp
                { name = "luasnip" }, -- snippets
                { name = "crates" }, -- rust crates
                { name = "path" },
                { name = "buffer", keyword_length = 5 },
            },
            formatting = {
                format = require("nvim-highlight-colors").format,
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer", keyword_length = 5 },
            },
        })
    end,
}
