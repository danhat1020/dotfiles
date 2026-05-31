vim.pack.add({ 'file://' .. os.getenv('HOME') .. '/dev/neovim_plugins/silence' }) -- load colorscheme
require('silence').setup({ transparent = true })
vim.cmd('colorscheme silence')
-- *** OPTIONS ***
vim.o.termguicolors = true                                                                -- ui
vim.o.guicursor = ''                                                                      -- **
require('vim._core.ui2').enable()                                                         -- **
vim.o.signcolumn = 'no'                                                                   -- **
vim.o.winborder = 'single'                                                                -- **
vim.o.number = true                                                                       -- line number
vim.o.relativenumber = true                                                               -- **
vim.o.tabstop = 2                                                                         -- tab settings
vim.o.shiftwidth = 2                                                                      -- **
vim.o.expandtab = true                                                                    -- **
vim.o.autoindent = true                                                                   -- indenting
vim.o.smartindent = true                                                                  -- **
vim.o.splitright = true                                                                   -- splits
vim.o.splitbelow = true                                                                   -- **
vim.o.swapfile = false                                                                    -- external files
vim.o.undofile = true                                                                     -- **
vim.o.incsearch = true                                                                    -- searching
vim.o.hlsearch = false                                                                    -- **
vim.o.ignorecase = true                                                                   -- **
vim.o.smartcase = true                                                                    -- **
vim.g.netrw_banner = 0                                                                    -- netrw
vim.g.netrw_list_hide = "^\\./$,^\\.\\./$"                                                -- **
vim.o.wrap = false                                                                        -- wrapping
vim.o.laststatus = 3                                                                      -- status line
vim.opt.clipboard:append('unnamedplus')                                                   -- clipboard
-- *** KEYMAPS & AUTOCMDS ***
vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<C-c>', '<Esc>')                                  -- Ctrl+c as escape
vim.keymap.set('n', '-', vim.cmd.Ex)                                                      -- '-' to enter file explorer
vim.cmd('autocmd TextYankPost * lua vim.highlight.on_yank({ timeout = 135 })')            -- highlight on yank
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o') -- no auto-commenting
-- *** FUZZY FIND ***
vim.opt.path = '.,,*,**'
vim.opt.wildmode = 'noselect'
vim.api.nvim_create_autocmd('CmdlineChanged', {
  pattern = ':',
  callback = function()
    local cmdline = vim.fn.getcmdline()
    if cmdline:match('^fin') or cmdline:match('help') then vim.fn.wildtrigger() end
  end,
})
_G.my_find = function(text, _) return vim.fn.matchfuzzy(vim.fn.glob('**/*', true, true), text) end
vim.opt.findfunc = 'v:lua.my_find'
-- *** RIPGREP ***
vim.opt.grepprg = "rg --vimgrep --no-hidden --no-heading"
vim.cmd('command! -nargs=+ Rg execute "silent grep! <args> | copen"')
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.api.nvim_feedkeys(vim.keycode('<cr><C-w>p'), 'n', false)
    vim.keymap.set('n', 'j', 'j<cr><C-w>p', { noremap = true, buffer = true })
    vim.keymap.set('n', 'k', 'k<cr><C-w>p', { noremap = true, buffer = true })
    vim.keymap.set('n', '<cr>', '<cr><cmd>cclose<cr>', { noremap = true, buffer = true })
  end,
})
-- *** LSP ***
for _, server in ipairs({ 'emmylua_ls', 'clangd', 'bashls', 'rust_analyzer', 'gopls' }) do vim.lsp.enable(server) end
vim.o.completeopt = 'menu,noinsert,noselect,fuzzy,popup'
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method('textDocument/completion') then
      local chars = {}
      for i = 33, 122 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, noremap = true })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, noremap = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = ev.buf, callback = function() vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 }) end
    })
  end,
})
