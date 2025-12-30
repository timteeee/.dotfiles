return {
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,
    },
    {
        "saecki/crates.nvim",
        tag = "stable",
        event = "BufRead Cargo.toml",
        opts = {
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        },
    },
}
