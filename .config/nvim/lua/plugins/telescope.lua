return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
        },
        config = function()
            require("telescope").setup({
                defaults = require("telescope.themes").get_ivy(),
            })

            pcall(require("telescope").load_extension, "ui-select")
            pcall(require("telescope").load_extension, "fzf")

            -- See `:help telescope.builtin`
            local builtin = require("telescope.builtin")

            -- NOTE: this is actually <C-/> but terminal keycodes are weird
            vim.keymap.set("n", "<C-_>", function()
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    previewer = false,
                }))
            end, { desc = "Fuzzily search in current buffer" })

            vim.keymap.set("n", "<leader>sf", function()
                builtin.find_files()
            end, { desc = "[S]earch [F]iles" })
            vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = "[S]earch [R]ecent files" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
            vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
            vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
            vim.keymap.set("n", "<leader>sc", builtin.highlights, { desc = "[S]earch [C]olor Highlight Groups" })
        end,
    },
}
