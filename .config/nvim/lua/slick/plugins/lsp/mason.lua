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
  end,
}
