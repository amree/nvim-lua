local o = vim.opt -- to set options

-- Ref: https://neovim.io/doc/user/options.html
o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.completeopt = "menu,menuone,noselect" -- comma separated value list of options for Insert mode completion
o.cursorline = true -- highlight current line
o.fileencoding = "utf-8" -- the encoding written to file
o.expandtab = true -- use spaces instead of tabs
o.foldenable = false -- disable folding; enable with zi
o.foldmethod = "indent" -- fold ident mode
o.ignorecase = true -- ignore case
o.inccommand = "split" -- get a preview of replacements
o.number = true -- show line numbers
o.list = true -- show some invisible characters
o.listchars = { tab = " ", trail = "·" }
o.relativenumber = true -- show line number relative to the cusor
o.scrolloff = 4 -- minimal lines to show above and below the cursor
o.shiftwidth = 2 -- Size of an indent
o.showmode = false -- Don't display mode like INSERT
o.sidescrolloff = 8 -- minimal number of columns to scroll horizontally
o.smartindent = true -- Insert indents automatically
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.tabstop = 2 -- How many columns a tab counts for
o.termguicolors = true -- Enable true colour support
o.title = true -- Allows neovim to send the Terminal details of the current window, instead of just getting 'v'
o.lazyredraw = true -- do not redraw screen while running macros
