return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[  ██████   █████                   █████   █████  ███                  ]],
      [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
      [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
      [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
      [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
      [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
      [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
      [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("␣sf", "  |  Search files with Telescope", "<CMD>Telescope find_files<CR>"),
      dashboard.button("-", "  |  Open file explorer", "<CMD>Oil<CR>"),
      dashboard.button("␣la", "󰚥  |  Open Lazy", "<CMD>Lazy<CR>"),
      dashboard.button("rc", "  |  NeoVim Config", "<CMD>tcd ~/dotfiles/.config/nvim<CR><CMD>Oil<CR>"),
      dashboard.button("cf", "󰟃  |  Edit dotfiles", "<CMD>tcd ~/dotfiles<CR><CMD>Oil<CR>"),
      dashboard.button("q", "󰅙  |  Quit NeoVim", "<CMD>qa<CR>"),
    }

    alpha.setup(dashboard.opts)
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
