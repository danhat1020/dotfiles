return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local tele = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    tele.setup({
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
    vim.keymap.set("n", "<leader>sf", builtin.find_files,
    { desc = "Fuzzy find files in current directory", silent = true, noremap = true })
    vim.keymap.set("n", "<leader>ss", function()
      builtin.grep_string({ search = vim.fn.input("Grep -> ") })
    end)
  end
}
