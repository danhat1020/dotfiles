return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
			}
		})

		vim.keymap.set("n", "-", vim.cmd.Oil, { desc = "Open Oil file explorer", silent = true, noremap = true })
	end,
}
