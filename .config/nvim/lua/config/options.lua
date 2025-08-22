-- =======================================================================
-- TITLE : NeoVim options
-- ABOUT : basic settings native to neovim
-- =======================================================================

-- [BASIC]
vim.opt.nu = true  -- line numbers
vim.opt.relativenumber = true  -- relative line numbers
vim.opt.scrolloff = 10  -- 10 lines of padding vertically
vim.opt.sidescrolloff = 10  -- 10 characters of padding horizontally
vim.opt.wrap = false  -- disable wrapping
vim.opt.cmdheight = 1  -- command line height
vim.opt.spelllang = { "en" }

-- [TABBING | INDENTATION]
vim.opt.tabstop = 2  -- tab width
vim.opt.shiftwidth = 2  -- indent width
vim.opt.softtabstop = 2  -- soft tab stop
vim.opt.expandtab = true  -- use space instead of tab
vim.opt.smartindent = true  -- smart auto-indenting
vim.opt.autoindent = true  -- copy indent from current line
vim.opt.grepprg = "rg --vimgrep"  -- use ripgrep if available
vim.opt.grepformat = "%f:%l:%c:%m"  -- file name, line number, column, content

-- [CURSOR]
vim.opt.guicursor = ""

-- [SEARCH]
vim.opt.ignorecase = true  -- disable case-sensitive search
vim.opt.smartcase = true  -- enable case-sensitive if uppercase in search
vim.opt.hlsearch = false  -- disable search highlighting
vim.opt.incsearch = true  -- show matches as you type

-- [VISUAL]
vim.opt.termguicolors = true  -- enable 24-bit colors
vim.opt.signcolumn = "yes"  -- always show sign column
vim.opt.showmatch = false  -- don't show matching brackets
vim.opt.matchtime = 2  -- how long to show matching bracket
vim.opt.completeopt = "menuone,noinsert,noselect"  -- completion options
vim.opt.showmode = false  -- don't show mode in command line
vim.opt.pumheight = 10  -- popup menu height
vim.opt.pumblend = 10  -- popup menu transparency
vim.opt.winblend = 0  -- floating window transparency
vim.opt.conceallevel = 0  -- don't hide markup
vim.opt.concealcursor = ""  -- show markup even on cursor line
vim.opt.lazyredraw = true  -- redraw while executing macros (better UX)
vim.opt.redrawtime = 1000  -- timeout for syntax highlighting redraw
vim.opt.maxmempattern = 20000  -- max memory for pattern matching
vim.opt.synmaxcol = 300  -- syntax highlighting column limit
vim.opt.winborder = "rounded"

-- [FILE HANDLING]
vim.opt.backup = false  -- don't create backup files
vim.opt.writebackup = false  -- don't backup before overwriting
vim.opt.swapfile = false  -- don't create swapfiles
vim.opt.undofile = true  -- persistent undo
vim.opt.updatetime = 300  -- time in ms to trigger CursorHold
vim.opt.timeoutlen = 500  -- time in ms to wait for mapped sequence
vim.opt.ttimeoutlen = 0  -- no wait for key code sequences
vim.opt.autoread = true  -- auto-update file if file changed outside
vim.opt.autowrite = false  -- don't auto-save on some events

-- [UNDO DIR PATH]
local undodir = "~/.local/share/nvim/undodir"
vim.opt.undodir = vim.fn.expand(undodir)
local undodir_path = vim.fn.expand(undodir)
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, "p")
end

-- [BEHAVIOUR]
vim.opt.errorbells = false  -- disable error sounds
vim.opt.backspace = "indent,eol,start"  -- natural backspace
vim.opt.autochdir = false -- don't change directory automatically
vim.opt.path:append("**")  -- search into subfolders with `gf`
vim.opt.selection = "inclusive"  -- use inclusive selection
vim.opt.modifiable = true  -- allow editing buffers
vim.opt.encoding = "UTF-8"  -- use utf-8 encoding
vim.opt.wildmenu = true  -- enable cmd completion menu
vim.opt.wildmode = "longest:full,full"  -- completion mode for cmd
vim.opt.wildignorecase = true  -- not case-sensitive
