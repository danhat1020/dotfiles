return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    require("telescope").setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, opts)
    vim.keymap.set("n", "<leader>ss", function()
      builtin.grep_string({ search = vim.fn.input("Grep: ") })
    end, opts)
  end,
}
