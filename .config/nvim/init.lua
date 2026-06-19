vim.opt.runtimepath:append(vim.fn.expand('~/dev/neovim_plugins/silence'))
require('silence').setup({ transparent = true })
vim.cmd('colorscheme silence')
-- OPTIONS
vim.o.termguicolors = true
vim.o.guicursor = ''
require('vim._core.ui2').enable()
vim.o.signcolumn = 'no'
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.g.netrw_banner = 0
vim.o.wrap = false
vim.opt.clipboard:append('unnamedplus')
-- KEYMAPS & AUTOCMDS
vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<C-c>', '<esc>')
vim.keymap.set('n', '-', vim.cmd.Ex)
vim.cmd('autocmd TextYankPost * lua vim.hl.hl_op({ higroup = "IncSearch", timeout = 120 })') -- highlight on yank
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')    -- no auto-commenting
-- FUZZY FIND
vim.opt.path = '.,,*,**'
vim.opt.wildmode = 'noselect'
local match_fuzzy = function()
  local matches = { 'fin', 'h ', 'help ', '^b ' }
  for _, string in ipairs(matches) do if vim.fn.getcmdline():match(string) then vim.fn.wildtrigger() end end
end
vim.api.nvim_create_autocmd('CmdlineChanged', { pattern = ':', callback = match_fuzzy })
_G.my_find = function(text, _) return vim.fn.matchfuzzy(vim.fn.glob('**/*', true, true), text) end
vim.opt.findfunc = 'v:lua.my_find'
-- GREP
vim.opt.grepprg = "grep -HRIn $* ."
vim.opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"
vim.api.nvim_create_autocmd("FileType", {
  pattern = 'qf',
  callback = function(ev)
    vim.keymap.set('n', 'k', 'k<cr><C-w>p', { buffer = ev.buf, noremap = true })
    vim.keymap.set('n', 'j', 'j<cr><C-w>p', { buffer = ev.buf, noremap = true })
    vim.keymap.set('n', '<cr>', '<cr><cmd>cclose<cr>', { buffer = ev.buf, noremap = true, silent = true })
  end,
})
-- LSP
vim.opt.completeopt = "fuzzy,menu,menuone,popup,noinsert"
for _, server in ipairs({ 'emmylua_ls', 'clangd', 'bashls', 'rust_analyzer', 'gopls' }) do vim.lsp.enable(server) end
local function setup_lsp(ev)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, silent = true, noremap = true })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, silent = true, noremap = true })
  local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
  vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
  vim.keymap.set('i', '<C-e>', vim.lsp.completion.get, { noremap = true })
  -- autoformat
  local ext = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(ev.buf), ':e')
  if ext ~= 'c' and ext ~= 'h' then
    local autoformat_opts = { buffer = ev.buf, callback = function() vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 }) end }
    vim.api.nvim_create_autocmd('BufWritePre', autoformat_opts)
  end
end
vim.api.nvim_create_autocmd('LspAttach', { callback = setup_lsp })
-- TURN OFF LSP DIAGNOSTICS FOR .C AND .H FILES
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.c', '*.h' },
  callback = function(args)
    for _, k in ipairs({ '<C-w>d', '<C-w><C-d>', ']d', '[d' }) do vim.keymap.set('n', k, '<nop>', { buffer = args.buf }) end
    vim.diagnostic.enable(false, { bufnr = args.buf })
    vim.diagnostic.status = function() return "" end
  end,
})
