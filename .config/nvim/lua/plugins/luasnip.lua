return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")

        ls.config.set_config({
            link_children = true,
            updateevents = "TextChanged,TextChangedI",
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "   <C-n>/<C-p> to cycle options", "SpecialKey" } },
                    },
                },
            },
        })

        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-n>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { desc = "[N]ext choice in list" })

        vim.keymap.set({ "i", "s" }, "<C-p>", function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end, { desc = "[P]revious choice in list" })
    end,
}
