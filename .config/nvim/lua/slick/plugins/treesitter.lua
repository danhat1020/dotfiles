return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      ensure_installed = { "python", "java", "javascript", "typescript", "yaml", "html", "css", "markdown", "markdown_inline", "bash", "lua", "vim", "vimdoc", "rust" },
      ignore_install = {},
      modules = {},
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<BS>"
        },
      },
    })
  end,
}
