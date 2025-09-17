return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lazy_status = require("lazy.status")

    local colors = {
      normal = "#124ba1",
      insert = "#a11284",
      visual = "#5512a1",
      replace = "#a11223",
      command = "#a15912",
      terminal = "#12a133",
      fg = "#c0c0c0",
      bg = "#0b0a09",
    }

    local my_theme = {
      normal = {
        a = { bg = colors.normal, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg},
        c = { bg = colors.bg, fg = colors.fg},
      },
      insert = {
        a = { bg = colors.insert, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg},
        c = { bg = colors.bg, fg = colors.fg},
      },
      visual = {
        a = { bg = colors.visual, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg},
        c = { bg = colors.bg, fg = colors.fg},
      },
      command = {
        a = { bg = colors.command, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg},
        c = { bg = colors.bg, fg = colors.fg},
      },
      replace = {
        a = { bg = colors.replace, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg},
        c = { bg = colors.bg, fg = colors.fg},
      },
    }

    require("lualine").setup({
      options = {
        theme = my_theme,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filetype' },
        lualine_c = { 'filename' },

        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff6030" },
          }
        },
        lualine_y = { 'branch', 'diff', 'diagnostics' },
        lualine_z = { 'location' },
      }
    })
  end,
}
