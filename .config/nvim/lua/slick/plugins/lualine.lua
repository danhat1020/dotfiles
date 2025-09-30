return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      normal = "#4871e0",
      insert = "#da48e0",
      visual = "#9c48e0",
      replace = "#e04863",
      command = "#e08748",
      terminal = "#48e07d",
      fg = "#e0e0e0",
      bg = "#0a0a0a",
    }

    local my_theme = {
      normal = {
        a = { bg = colors.normal, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.insert, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.visual, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.command, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.replace, fg = colors.bg, gui = "bold" },
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
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "|", right = "" },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { branch, diff },
        lualine_c = { filename, "diagnostics" },

        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff6030" },
          },
          { "filetype" },
        },
      }
    })
  end,
}
