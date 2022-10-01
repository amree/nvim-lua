local map = vim.keymap.set
local default_options = { silent = true }
local expr_options = { expr = true, silent = true }

-- Remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", default_options)
vim.g.mapleader = " "

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', default_options)

-- Use jj to escape for normal mode
map("i", "jj", "<Esc>")

-- Previous buffer (?)
map("n", "<Leader><Leader>", "<c-^>")

map("n", "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", default_options)
map("n", "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", default_options)
map("n", "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", default_options)
map("n", "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", default_options)
