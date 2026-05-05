-- options
vim.o.cursorline = true
vim.o.winborder = 'single'
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.guicursor = ''
vim.cmd('set clipboard+=unnamedplus')
require('vim._core.ui2').enable()
vim.cmd.colorscheme('silence')
vim.o.wildmode = 'noselect'
vim.opt.path = '.,,*,**'
vim.opt.grepprg = "rg --vimgrep --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.g.netrw_keepdir = 1
vim.g.netrw_banner = 0
vim.g.mapleader = ' '
vim.keymap.set({ 'i', 'v', 'x' }, '<C-c>', '<Esc>')
vim.keymap.set('n', '-', ':Ex<CR>', { silent = true })
vim.keymap.set('n', '<leader>r', ':%s/\\(<C-r><C-w>\\)//gI<Left><Left><Left>')
vim.keymap.set("n", "p", "p`[v`]=", { noremap = true })
vim.keymap.set("n", "P", "P`[v`]=", { noremap = true })
FormatFile = function()
  local view = vim.fn.winsaveview()
  local saved_search = vim.fn.getreg('/')
  vim.cmd([[silent! retab]])
  vim.cmd([[silent! %s/\s\+$//e]])
  vim.cmd([[silent! %s/\n\{3,}/\r\r/e]])
  vim.cmd([[silent! %s/\($\n\)\+\%$//e]])
  vim.fn.winrestview(view)
  vim.fn.setreg('/', saved_search)
end
vim.cmd('autocmd BufWritePre * lua FormatFile()')
vim.cmd('autocmd TextYankPost * lua vim.highlight.on_yank()')
vim.cmd('autocmd FileType help :wincmd L')
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
-- lsp
vim.diagnostic.config({ signs = false })
vim.o.completeopt = "menu,menuone,noselect,fuzzy,popup"
vim.g.c_no_curly_error = 1
local servers = { "emmylua_ls", "clangd", "bashls" }
for _, server in ipairs(servers) do vim.lsp.enable(server) end
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities--[[@cast -?]].completionProvider--[[@cast -?]].triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, noremap = true })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, noremap = true })
  end,
})
