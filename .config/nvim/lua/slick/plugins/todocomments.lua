return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      FIX = { icon = " ", color = "#BA3E47", alt = { "FIXME" } },
      TODO = { icon = "↻ ", color = "#BA693E" },
      WARN = { icon = "⚠ ", color = "#B6A43D" },
      NOTE = { icon = "✚ ", color = "#446B99", alt = { "INFO" } },
    },
  },
}
