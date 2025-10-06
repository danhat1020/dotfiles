vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- clipboard
map({ "n", "v", "x" }, "<leader>y", "\"+y")
map({ "n", "v", "x" }, "<leader>p", "\"+p")

-- center when moving around
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "G", "Gzz")

-- keypress corrections
map("i", "<C-BS>", "<C-w>")
map({ "n", "v", "x" }, ":", ";")
map({ "n", "v", "x" }, ";", ":")

-- tabs
map("n", "<A-c>", ":tabnew<CR>")
map("n", "<A-x>", ":tabclose<CR>")
map("n", "<A-n>", ":tabnext<CR>")
map("n", "<A-p>", ":tabprev<CR>")
map("n", "<A-f>", ":tabnew %<CR>")

-- plugin functions
map("n", "<leader>la", ":Lazy<CR>")
map("n", "<leader>a", "<CMD>Alpha<CR>")
map("n", "<leader>lf", function() vim.lsp.buf.format() end)

-- file navigation
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

-- moving lines
map("n", "<A-j>", ":m .+1<CR>==", { silent = true, noremap = true })
map("n", "<A-k>", ":m .-2<CR>==", { silent = true, noremap = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- presentation
map("v", "<C-j>", "<Esc>jV")
map("v", "<C-k>", "<Esc>kV")

-- other
map("n", "<leader><leader>x", ":%lua<CR>")
map({ "n", "v" }, "<leader>n", ":norm ")
map("n", "<Space>", "<Nop>")
