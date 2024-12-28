-- Tab size
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Remove statusline and hide command line when not in use
vim.opt.laststatus = 0

-- Disable current mode being shown in command line
vim.opt.showmode = false

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

-- Enable mouse mode
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300
