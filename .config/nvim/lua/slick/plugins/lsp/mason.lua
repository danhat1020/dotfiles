return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "rust_analyzer",
      "lua_ls",
      "ts_ls",
      "html",
      "cssls",
    },
  },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
          },
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = { "saghen/blink.cmp" },
      config = function()
        local servers = {
          clangd = {},
          rust_analyzer = {},
          lua_ls = {},
          ts_ls = {},
          html = {},
          cssls = {},
        }

        for server, config in pairs(servers) do
          config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

          vim.lsp.config(server, config)
          vim.lsp.enable(server)
        end
      end,
    }
  },
}
