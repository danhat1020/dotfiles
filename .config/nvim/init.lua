-- [SETTINGS]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cinwords = "<"
vim.opt.indentexpr = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.guicursor = ""

-- [KEYBINDS]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- centering the screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)", silent = true, noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)", silent = true, noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)", silent = true, noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)", silent = true, noremap = true })
vim.keymap.set("n", "<S-g>", "<S-g>zz", { desc = "Go to end of file (centered)", silent = true, noremap = true })
-- quality of life
vim.keymap.set("n", "Y", "yy", { desc = "Yank whole line", silent = true, noremap = true })
vim.keymap.set("n", "D", "dd", { desc = "Delete whole line", silent = true, noremap = true })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Ctrl + backspace to delete whole word", silent = true })
vim.keymap.set("n", "<leader><S-d>", "godG", { desc = "Delete whole file", silent = true, noremap = true })
vim.keymap.set({ "v", "n" }, "<leader>d", "\"_d", { desc = "Delete to void buffer", silent = true, noremap = true })
-- functionality
vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y", { desc = "Copy to system clipboard", silent = true, noremap = true })
vim.keymap.set({ "v", "n" }, "<leader>p", "\"+p", { desc = "Copy to system clipboard", silent = true, noremap = true })
-- tabs
vim.keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "Open new tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ti", ":tabnew %<CR>",
    { desc = "Open current buffer in new tab", silent = true, noremap = true })

-- [PLUGINS]
vim.pack.add({
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    { src = "https://github.com/nvim-telescope/telescope.nvim",   branch = "0.1.x" },
    { src = "https://github.com/mattn/emmet-vim" },
    { src = "https://github.com/NStefan002/screenkey.nvim",       branch = "*" },
    { src = "https://github.com/sourcegraph/go-lsp" },
})

-- [LSP]
vim.lsp.enable({ "lua_ls", "cssls", "html", "ts_ls", "rust_analyzer", "glsl_analyzer", "pyright", "gopls",
    "golangci_lint_ls", "csharp_ls", "omnisharp" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format current file using lsp" })
vim.g.rust_recommended_style = 0
vim.g.go_fmt_command = "goimports"

require("mason").setup()

require("core")
