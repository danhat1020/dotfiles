return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local logo = {
      [[                                                  ]],
      [[                                                  ]],
      [[                                                  ]],
      [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
      [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
      [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
      [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
      [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
      [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      [[                                                  ]],
      [[                                                  ]],
      [[                                                  ]],
    }

    dashboard.section.header.val = logo

    dashboard.section.buttons.val = {
      dashboard.button("-", "  |  Open file explorer", "<CMD>Oil<CR>"),
      dashboard.button("SPC sf", "  |  Search files with Telescope", "<CMD>Telescope find_files<CR>"),
      dashboard.button("SPC la", "󰚥  |  Open Lazy", "<CMD>Lazy<CR>"),
      dashboard.button("rc", "  |  NeoVim Config", "<CMD>lcd ~/dotfiles/.config/nvim<CR><CMD>Oil<CR>"),
      dashboard.button("cf", "󰟃  |  Edit dotfiles", "<CMD>lcd ~/dotfiles<CR><CMD>Oil<CR>"),
      dashboard.button("q", "󰅙  |  Quit NeoVim", "<CMD>qa<CR>"),
    }

    alpha.setup(dashboard.opts)
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
