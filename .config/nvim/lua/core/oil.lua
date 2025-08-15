require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
})
vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open Oil file explorer", silent = true, noremap = true })
