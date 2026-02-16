-- Default border for windows and floats
vim.opt.winborder = "rounded"

-- Tab size
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Enable break indent
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Splits
vim.opt.splitright = true

-- Line wrap
vim.opt.wrap = false

-- Min lines between cursor and beginning/end of file
vim.opt.scrolloff = 8

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Save undo history
vim.opt.undofile = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

-- Change tildes at end of file into spaces
vim.opt.fillchars = { eob = " " }

-- Enable mouse mode
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"

-- Set leader key to space
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for moving selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep selection selected after shifting indents
vim.keymap.set("v", ">", ">gv", { desc = "Go to previous selection after indenting in" })
vim.keymap.set("v", "<", "<gv", { desc = "Go to previous selection after indenting out" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Disable "s" mapping to "cl"
vim.keymap.set("n", "s", "<Nop>")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- LSP Related Keybinds on LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspKeybinds", { clear = true }),
    callback = function(event)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "[G]oto [D]efinition" })
        vim.keymap.set("n", "grs", "<CMD>LspRestart<CR>", { buffer = event.buf, desc = "LSP [R]e[s]tart" })
        vim.keymap.set("n", "gH", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle LSP Inlay Hints" })
    end,
})

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
    virtual_lines = { current_line = true },
    underline = true,
    severity_sort = true,
})
