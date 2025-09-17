return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup()

      vim.lsp.enable("html")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("cssls")
      vim.lsp.enable("emmet_language_server")
      vim.lsp.enable("prettierd")
      vim.lsp.enable("omnisharp")
    end,
  }
}
