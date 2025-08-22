-- =======================================================================
-- TITLE : NeoVim keymaps
-- ABOUT : keymaps to improve quality of using neovim
-- =======================================================================

-- centering screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result", silent = true, noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result", silent = true, noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down", silent = true, noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up", silent = true, noremap = true })
-- quality of life
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Ctrl+backspace deletes word", silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "d", "\"_d", { desc = "Delete without overwriting", silent = true, noremap = true })
vim.keymap.set({ "v", "i" }, "<Esc>", "<Esc>l", { desc = "Escape to current position", silent = true, noremap = true })
-- functionality
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard", silent = true, noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { desc = "Paste from system clipboard", silent = true, noremap = true })
-- tabs
vim.keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "Open new tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab", silent = true, noremap = true })
vim.keymap.set("n", "<leader>ti", ":tabnew %<CR>", { desc = "Open current buffer in new tab", silent = true, noremap = true })
