return {
    "j-hui/fidget.nvim",
    opts = {
        progress = {
            -- How to get a progress message's notification group key
            notification_group = function(msg)
                return msg.lsp_client.name
            end,
            -- Clear notification group when LSP server detaches
            clear_on_detach = function(client_id)
                local client = vim.lsp.get_client_by_id(client_id)
                return client and client.name or nil
            end,
            display = {
                -- Override options from the default notification config
                overrides = {
                    rust_analyzer = { name = "rust-analyzer" },
                },
            },
        },
    },
}
