vim.cmd("command! -nargs=+ Grep execute 'silent grep <args>' | copen")

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    local enter = vim.keycode('<CR><C-w>p')
    vim.api.nvim_feedkeys(enter, 'n', false) -- show first search result
    vim.keymap.set('n', 'j', 'j<CR><C-w>p', { noremap = true, buffer = true }) -- show result on nagivate
    vim.keymap.set('n', 'k', 'k<CR><C-w>p', { noremap = true, buffer = true }) -- show result on nagivate
    vim.keymap.set('n', '<CR>', '<CR>:cclose<CR>', { noremap = true, buffer = true }) -- close quickfix list on enter
  end,
})
