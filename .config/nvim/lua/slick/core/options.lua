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
o.winborder = "double"
o.swapfile = false
o.undofile = true
o.path:append("**")
o.showmode = false
o.backspace = "indent,eol,start"
vim.g.editorconfig = true
o.updatetime = 50
-- o.guicursor = ""

-- AUTOCOMMANDS
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ async = false, id = args.data.client_id })
      end,
    })
  end,
})
