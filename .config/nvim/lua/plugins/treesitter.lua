return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        init = function()
            local ensure_installed = {
                "javascript",
                "typescript",
                "tsx",
                "jsdoc",
                "astro",
                "html",
                "htmldjango",
                "css",
                "scss",
                "lua",
                "luadoc",
                "python",
                "rust",
                "zig",
                "go",
                "templ",
                "sql",
                "dockerfile",
                "vimdoc",
                "vim",
            }

            local already_installed = require("nvim-treesitter.config").get_installed()
            local parsers_to_install = vim.iter(ensure_installed)
                :filter(function(parser)
                    return not vim.tbl_contains(already_installed, parser)
                end)
                :totable()
            require("nvim-treesitter").install(parsers_to_install)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                    lookbehind = true,
                    selection_modes = {
                        ["@function.outer"] = "V",
                        ["@class.outer"] = "V",
                    },
                    include_surrounding_whitespace = false,
                },
            })

            vim.keymap.set({ "x", "o" }, "af", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.outer")
            end)
            vim.keymap.set({ "x", "o" }, "if", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.inner")
            end)
            vim.keymap.set({ "x", "o" }, "ac", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@class.outer")
            end)
            vim.keymap.set({ "x", "o" }, "ic", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@class.inner")
            end)
        end,
    },
}
