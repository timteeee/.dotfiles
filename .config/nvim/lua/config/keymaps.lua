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

-- Quickfix list navigation
vim.keymap.set("n", "[q", "<CMD>cprev<CR>", { desc = "Go to previous quickfix list entry" })
vim.keymap.set("n", "]q", "<CMD>cnext<CR>", { desc = "Go to next quickfix list entry" })

-- Disable "s" mapping to "cl"
vim.keymap.set("n", "s", "<Nop>")
