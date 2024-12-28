return {
    "brenoprata10/nvim-highlight-colors",
    config = function()
        require("nvim-highlight-colors").setup({
            render = "background",
            -- render = "virtual",
            virtual_symbol_position = "eol",
            enabled_named_colors = false,
            enable_tailwind = true,
        })
    end,
}
