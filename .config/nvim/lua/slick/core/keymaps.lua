function Map(mode, lhs, rhs, opts)
  local options = { silent = true, noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

Map({ "n", "v", "x" }, "<leader>y", "\"+y")                 -- copy to clipboard
Map({ "n", "v", "x" }, "<leader>p", "\"+p")                 -- paste from clipboard

Map("n", "n", "nzzzv")                                      -- center when searching
Map("n", "N", "Nzzzv")                                      -- center when searching backward
Map("n", "<C-d>", "<C-d>zz")                                -- center when jumping down
Map("n", "<C-u>", "<C-u>zz")                                -- center when jumping up
Map("n", "G", "Gzz")                                        -- center when going to bottom of file

Map("i", "<C-BS>", "<C-w>")                                 -- ctrl+backspace deletes whole word

Map("n", "<A-c>", ":tabnew<CR>")                            -- open new tab
Map("n", "<A-x>", ":tabclose<CR>")                          -- close current tab
Map("n", "<A-n>", ":tabnext<CR>")                           -- go to next tab
Map("n", "<A-p>", ":tabprev<CR>")                           -- go to previous tab
Map("n", "<A-f>", ":tabnew %<CR>")                          -- open current buffer in new tab

Map("v", ">", ">gv")                                        -- indent while selected
Map("v", "<", "<gv")                                        -- unindent while selected

Map("n", "<leader>la", ":Lazy<CR>")                         -- open lazy dashboard

Map("n", "<leader>lf", function() vim.lsp.buf.format() end) -- [L]SP [F]ormat

Map("n", "-", "<CMD>Oil<CR>")                               -- open file explorer

Map("n", "<A-j>", ":m .+1<CR>==")                           -- move line down
Map("n", "<A-k>", ":m .-2<CR>==")                           -- move line up

Map("v", "<A-j>", ":m '>+1<CR>gv=gv")                       -- move selected lines down
Map("v", "<A-k>", ":m '<-2<CR>gv=gv")                       -- move selected lines up

Map("v", "<C-j>", "<Esc>jV")                                -- select line below
Map("v", "<C-k>", "<Esc>kV")                                -- select line above

Map("n", "<leader><leader>x", ":%lua<CR>")                  -- e[X]ecute current lua file

Map("n", "<leader>a", "<CMD>Alpha<CR>")                     -- open start page

Map("n", "<leader>ks", "<CMD>Screenkey toggle<CR>")         -- toggle screenkey

Map("n", "Q", "<nop>")                                      -- disable capital Q
