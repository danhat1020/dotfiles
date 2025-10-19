return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      highlight = "#404040",
      fg = "#f0f0f0",
      bg = "#080808",
    }

    local my_theme = {
      normal = {
        a = { bg = colors.highlight, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.highlight, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.highlight, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.highlight, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.highlight, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local filename = {
      "filename",
      symbols = {
        modified = " [+]",
        readonly = " ",
        unnamed = "",
      }
    }

    local col = "#f06050"
    local branch = { "branch", icon = { "", color = { fg = col } }, "|" }

    lualine.setup({
      icons_enabled = true,
      options = {
        globalstatus = false,
        theme = my_theme,
        component_separators = " - ",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
      },
      tabline = {
        lualine_a = { 'mode' },
        lualine_b = { branch, diff },
        lualine_c = { filename, "diagnostics" },

        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff2028" },
          },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      sections = {},
    })
  end,
}
