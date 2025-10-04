return {
  "ficcdaf/ashen.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("ashen").setup({ transparent = true })
    vim.cmd.colorscheme("ashen")
  end,
}
