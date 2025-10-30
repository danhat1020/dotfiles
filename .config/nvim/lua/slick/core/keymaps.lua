vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

local opts = { silent = true, noremap = true }

-- clipboard
map({ "n", "v", "x" }, "<leader>y", "\"+y")
map({ "n", "v", "x" }, "<leader>p", "\"+p")

-- better pasting
map("v", "p", "\"_dP", opts)                 -- paste without overwriting buffer
map({ "n", "v" }, "<leader>d", "\"_d", opts) -- delete without copying to buffer
map({ "n", "v" }, "x", "\"_x", opts)         -- remove character without copying to buffer

-- center when moving around
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "G", "Gzz")

-- keypress corrections
map({ "n", "v", "x" }, ":", ";")
map({ "n", "v", "x" }, ";", ":")

-- plugin functions
map("n", "<leader>a", ":Alpha<CR>", opts)
map("n", "<leader>la", ":Lazy<CR>", opts)

-- navigation
map("n", "-", "<CMD>Oil<CR>")
map("n", "<leader>cd", function()
  if vim.bo.filetype == "oil" then
    local oil_dir = require("oil").get_current_dir()
    if oil_dir then
      vim.cmd("lcd " .. oil_dir)
    end
  else
    vim.cmd("lcd %:h")
  end
end)
map("n", "<leader>st", "<CMD>TodoTelescope<CR>", opts)

-- moving lines
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- presentation
map({ "n", "v" }, "<C-j>", "<Esc>jV")
map({ "n", "v" }, "<C-k>", "<Esc>kV")

-- other
map("n", "<leader>mx", "<CMD>!chmod +x %<CR>", opts) -- making a file executable
map("n", "<Space>", "<Nop>")                         -- unmapping space
map("n", "Q", "<Nop>")                               -- unmapping capital Q

local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true,
  })
end
vim.keymap.set('n', '<leader>qf', quickfix, opts)
