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

map("n", "<Leader><Leader>", "<c-^>")

-- map("n", ";", ":")
-- map("n", ";;", ";", { remap = true })
