local map = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    -- set keybinds
    opts.desc = "LSP Format file"
    map("n", "<leader>lf", vim.lsp.buf.format, opts)

    opts.desc = "Show LSP References"
    map("n", "<leader>lr", "<CMD>Telescope lsp_references<CR>", opts)

    opts.desc = "Go to declaration"
    map("n", "<leader>gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Go to LSP definition"
    map("n", "<leader>gd", vim.lsp.buf.definition, opts)

    opts.desc = "See available code actions"
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    map("n", "<leader>sd", "<CMD>Telescope diagnostics<CR>", opts)

    opts.desc = "Show documentation (hover)"
    map("n", "K", vim.lsp.buf.hover, opts)
  end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
