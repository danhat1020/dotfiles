-- OPTIONS
local o = vim.opt
o.number = true
o.relativenumber = true
o.scrolloff = 8
o.sidescrolloff = 8

o.wrap = false

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.signcolumn = "yes"
o.winborder = "rounded"

o.swapfile = false
o.undofile = true
o.path:append("**")
o.showmode = false
o.backspace = "indent,eol,start"
vim.g.editorconfig = true
o.updatetime = 50
