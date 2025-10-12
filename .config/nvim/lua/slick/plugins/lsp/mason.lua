return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")

    mason.setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    })

    vim.lsp.enable("html")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("cssls")
    vim.lsp.enable("emmet_language_server")
    vim.lsp.enable("prettierd")
    vim.lsp.enable("omnisharp")
    vim.lsp.enable("qmlls")
    vim.lsp.enable("clangd")

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
