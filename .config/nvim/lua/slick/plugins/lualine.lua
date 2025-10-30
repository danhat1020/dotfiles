return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      n = "#2E26C6",
      i = "#6829AC",
      v = "#206184",
      c = "#A51414",
      r = "#95255B",
      fg = "#f0f0f0",
      bg = "#000000",
      git = "#f06050",
    }

    local mono_colors = {
      hl = "#808080",
      fg = "#f0f0f0",
      bg = "#000000",
      git = "#c0c0c0",
    }

    local my_theme = {
      normal = {
        a = { bg = colors.n, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.i, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.v, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.c, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.r, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
    }

    local mono_theme = {
      normal = {
        a = { bg = mono_colors.hl, fg = mono_colors.bg, gui = "bold" },
        b = { bg = mono_colors.bg, fg = mono_colors.fg },
        c = { bg = mono_colors.bg, fg = mono_colors.fg },
      },
      insert = {
        a = { bg = mono_colors.hl, fg = mono_colors.bg, gui = "bold" },
        b = { bg = mono_colors.bg, fg = mono_colors.fg },
        c = { bg = mono_colors.bg, fg = mono_colors.fg },
      },
      visual = {
        a = { bg = mono_colors.hl, fg = mono_colors.bg, gui = "bold" },
        b = { bg = mono_colors.bg, fg = mono_colors.fg },
        c = { bg = mono_colors.bg, fg = mono_colors.fg },
      },
      command = {
        a = { bg = mono_colors.hl, fg = mono_colors.bg, gui = "bold" },
        b = { bg = mono_colors.bg, fg = mono_colors.fg },
        c = { bg = mono_colors.bg, fg = mono_colors.fg },
      },
      replace = {
        a = { bg = mono_colors.hl, fg = mono_colors.bg, gui = "bold" },
        b = { bg = mono_colors.bg, fg = mono_colors.fg },
        c = { bg = mono_colors.bg, fg = mono_colors.fg },
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

    local branch = { "branch", icon = { "", color = { fg = mono_colors.git } }, "|" }

    lualine.setup({
      icons_enabled = true,
      options = {
        globalstatus = false,
        theme = mono_theme,
        component_separators = " | ",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
      },
      sections = {
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
    })
  end,
}
