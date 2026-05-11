-- vim.opt.runtimepath:append(vim.fn.expand('~/dev/neovim_plugins/silence')) -- local version (for testing changes)
vim.pack.add({ 'https://github.com/danhat1020/silence.nvim' }) -- github version (for release)
require('silence').setup({ transparent = true })
vim.cmd('colorscheme silence')
-- options
vim.o.cursorline = true
vim.o.signcolumn = 'no'
vim.o.winborder = 'single'
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
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
vim.opt.clipboard:append('unnamedplus')
require('vim._core.ui2').enable()
vim.o.wildmode = 'noselect'
vim.opt.path = '.,,*,**'
vim.g.netrw_keepdir = 1
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = '\\./,\\.\\./'
vim.g.mapleader = ' '
vim.keymap.set({ 'i', 'v', 'x' }, '<C-c>', '<Esc>')
vim.keymap.set('n', '-', ':Ex<CR>', { silent = true })
FormatFile = function()
    local view = vim.fn.winsaveview()
    local saved_search = vim.fn.getreg('/')
    vim.cmd([[silent! retab]])                     -- change all tabs to spaces
    vim.cmd([[silent! %s/\($\n\)\+\%$//e]])        -- remove trailing blank lines at end of file
    vim.cmd([[silent! %s/\n\{3,}/\r\r/e]])         -- remove more than one blank line
    vim.cmd([[silent! %s/\s\+$//e]])               -- remove trailing whitespace
    vim.fn.winrestview(view)
    vim.fn.setreg('/', saved_search)
end
vim.cmd('autocmd BufWritePre * lua FormatFile()')
vim.cmd('autocmd TextYankPost * lua vim.highlight.on_yank()')
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')
-- lsp
local servers = { 'emmylua_ls', 'clangd', 'bashls', 'rust_analyzer' }
for _, server in ipairs(servers) do vim.lsp.enable(server) end
vim.o.completeopt = 'menu,menuone,noinsert,preselect,fuzzy,popup'
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
