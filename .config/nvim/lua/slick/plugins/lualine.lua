return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      normal = "#3048BF",
      insert = "#9B30BF",
      visual = "#BF3048",
      replace = "#BF30B3",
      command = "#BF6030",
      terminal = "#30BF54",
      fg = "#e0e0e0",
      bg = "#101010",
    }

    local my_theme = {
      normal = {
        a = { bg = colors.normal, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.insert, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.visual, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.command, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.replace, fg = colors.fg, gui = "bold" },
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
        modified = " []",
        readonly = " []",
        unnamed = "",
      }
    }

    local branch = { "branch", icon = { "", color = { fg = "#E97C74" } }, "|" }

    lualine.setup({
      icons_enabled = true,
      options = {
        theme = my_theme,
        component_separators = { left = "  ", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { branch, diff },
        lualine_c = { filename, "diagnostics" },

        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff4030" },
          },
          { "filetype" },
        },
      }
    })
  end,
}
