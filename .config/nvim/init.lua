if not (vim.version().minor >= 11) then
    vim.notify("Configuration relies on Nvim 0.11 features. Please update to at least 0.11.0", vim.log.levels.WARN)
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- Load configuration that doesn't depend on plugins, (e.g. options, keymaps, autocommands, diagnostics config, etc.)
require("config")

-- Configure lazy.nvim
require("lazy").setup("plugins", {
    install = {
        missing = true,
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    ui = {
        border = "rounded",
    },
})

require("colorscheme.tmrw").load()
