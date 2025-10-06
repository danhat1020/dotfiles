return {
  {
    "Yazeed1s/oh-lucy.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.oh_lucy_evening_transparent_background = true
    end,
  },
  {
    "ficcdaf/ashen.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("ashen").setup({ transparent = true })
    end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({ styles = { transparency = true } })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({ options = { transparent = true } })

      local color = "ashen"
      vim.cmd.colorscheme(color)
    end,
  },
}
