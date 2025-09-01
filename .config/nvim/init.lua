-- OPTIONS
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.path:append("**")
vim.opt.showmode = true
-- KEYMAPS
local opts = { silent = true, noremap = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "<Esc>", "<Esc>l", opts)
vim.keymap.set({ "n", "v", "x" }, "<leader>y", "\"+y", opts)
vim.keymap.set({ "n", "v", "x" }, "<leader>p", "\"+p", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("i", "<C-BS>", "<C-w>", opts)
vim.keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "Open new tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ti", ":tabnew %<CR>",
  { desc = "Open current buffer in new tab", silent = true, noremap = true })
-- PLUGINS
vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" },       -- dependencies
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/mattn/emmet-vim" },
})
-- LSP
vim.lsp.enable({ "html", "lua_ls", "ts_ls", "rust_analyzer", "cssls", "emmet_ls", "emmet_language_server", "prettierd" })
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
vim.opt.runtimepath:prepend('~/.local/share/nvim/site/pack/packer/start/emmet-vim')
vim.g.user_emmet_mode = 'a'
vim.g.user_emmet_leader_key = '<C-e>'

-- Enable for HTML and CSS files
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew' }, {
  pattern = "*.html",
  callback = function()
    vim.cmd("packadd emmet-vim")
  end
})
-- TREESITTER
require("nvim-treesitter.configs").setup({
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  ensure_installed = { "python", "java", "javascript", "typescript", "yaml", "html", "css", "markdown", "markdown_inline", "bash", "lua", "vim", "vimdoc", "rust" },
  ignore_install = {},
  modules = {},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<BS>",
    },
  },
})
-- COLORSCHEME
require("vague").setup({ transparent = true })
vim.cmd.colorscheme("vague")
-- OIL.NVIM
require("oil").setup({ view_options = { show_hidden = true } })
vim.keymap.set("n", "-", vim.cmd.Oil, opts)
-- TELESCOPE
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
require("telescope").setup({
  defaults = {
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})
vim.keymap.set("n", "<leader>sf", builtin.find_files, opts)
vim.keymap.set("n", "<leader>ss", function()
  builtin.grep_string({ search = vim.fn.input("Grep $ ") })
end, opts)
-- STATUSLINE
local function get_git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  return branch ~= "" and "  " .. branch or ""
end
local mode_map = {
  ['n'] = { label = 'NORMAL', color = '#569cd6' },
  ['i'] = { label = 'INSERT', color = '#d8a657' },
  ['v'] = { label = 'VISUAL', color = '#c678dd' },
  ['V'] = { label = 'V-LINE', color = '#c678dd' },
  [''] = { label = 'V-BLOCK', color = '#c678dd' },
  ['R'] = { label = 'REPLACE', color = '#d16969' },
  ['c'] = { label = 'COMMAND', color = '#4ec9b0' },
  ['t'] = { label = 'TERMINAL', color = '#4ec9b0' },
}
local update_statusline = function()
  local mode = vim.api.nvim_get_mode().mode
  local current_mode = mode_map[mode] or { label = mode, color = '#d4d4d4' }
  -- Build statusline without string.format
  vim.opt.statusline = ""
      .. "%#StatusLineMode#" .. " " .. current_mode.label .. " " .. "%#StatusLine#"
      .. " %t%m%r"
      .. "%#StatusLineNC#"
      .. "%=%{&fileencoding} %{&fileformat} %y" .. get_git_branch()
      .. " %#StatusLine#"
      .. " %l:%c "
end
vim.api.nvim_create_autocmd({ 'ModeChanged', 'BufEnter' }, {
  callback = update_statusline
})
update_statusline()
vim.cmd([[
  highlight StatusLine      guibg=NONE guifg=#c0c0c0 gui=bold
  highlight StatusLineNC    guibg=NONE guifg=#6e6a86
  highlight StatusLineMode  guibg=NONE guifg=#3c63f0
  augroup ModeColors
    autocmd!
    autocmd ModeChanged *:[n]* hi! StatusLineMode guifg=#228CC7
    autocmd ModeChanged *:[i]* hi! StatusLineMode guifg=#C722BF
    autocmd ModeChanged *:[vV]* hi! StatusLineMode guifg=#7F22C7
    autocmd ModeChanged *:[R]* hi! StatusLineMode guifg=#C72243
    autocmd ModeChanged *:[c]* hi! StatusLineMode guifg=#D46626
    autocmd ModeChanged *:[t]* hi! StatusLineMode guifg=#26D44C
  augroup END
]])
-- TABLINE
_G.custom_tabline = function()
  local line = ""
  for i = 1, vim.fn.tabpagenr("$") do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]

    local bufname = ""
    if bufnr and vim.fn.buflisted(bufnr) == 1 then
      bufname = vim.fn.bufname(bufnr) or ""
    end

    local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"

    if i == vim.fn.tabpagenr() then
      line = line .. "%#TabLineSel# " .. filename .. " %#TabLine#"
    else
      line = line .. "%#TabLine# " .. filename .. " "
    end
  end
  return line .. "%#TabLineFill#"
end
vim.opt.tabline = "%!v:lua.custom_tabline()"
vim.opt.showtabline = 2
vim.cmd("highlight TabLineSel guibg=#282828 guifg=#c0c0c0 gui=bold")
vim.cmd("highlight TabLine guibg=#141414 guifg=#808080")
vim.cmd("highlight TabLineFill guibg=none")
-- AUTOCOMMANDS
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = 200,
    })
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
