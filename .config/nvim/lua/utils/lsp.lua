local M = {}

M.on_attach = function(_, bufnr)
  local keymap = vim.keymap.set
  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }

  keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
  keymap("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
end

return M
