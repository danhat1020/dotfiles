function Map(mode, lhs, rhs, opts)
  local options = { silent = true, noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

Map({ "n", "v", "x" }, "<leader>y", "\"+y")                 -- copy to clipboard
Map({ "n", "v", "x" }, "<leader>p", "\"+p")                 -- paste from clipboard

Map("n", "n", "nzzzv")                                      -- center when searching
Map("n", "N", "Nzzzv")                                      -- center when searching backward
Map("n", "<C-d>", "<C-d>zz")                                -- center when jumping down
Map("n", "<C-u>", "<C-u>zz")                                -- center when jumping up
Map("n", "G", "Gzz")                                        -- center when going to bottom of file

Map("i", "<C-BS>", "<C-w>")                                 -- ctrl+backspace deletes whole word

Map("n", "<leader>tc", ":tabnew<CR>")                       -- open new tab
Map("n", "<leader>tx", ":tabclose<CR>")                     -- close current tab
Map("n", "<leader>tn", ":tabn<CR>")                         -- go to next tab
Map("n", "<leader>tp", ":tabp<CR>")                         -- go to previous tab
Map("n", "<leader>ti", ":tabnew %<CR>")                     -- open current buffer in new tab

Map("n", "<leader>rl", ":source $MYVIMRC<CR>")              -- reload nvim config

Map("v", ">", ">gv")                                        -- indent while selected
Map("v", "<", "<gv")                                        -- unindent while selected

Map("n", "<leader>la", ":Lazy<CR>")                         -- open lazy dashboard

Map("n", "<leader>fe", ":Oil<CR>")                          -- open oil file explorer

Map("n", "<leader>lf", function() vim.lsp.buf.format() end) -- format file

-- Add this mapping to check active LSP clients
vim.keymap.set('n', '<leader>l', function()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  print("Active LSP clients: " .. #clients)
  for _, client in ipairs(clients) do
    print(" - " .. client.name)
  end
end, { desc = "Check active LSP clients" })
