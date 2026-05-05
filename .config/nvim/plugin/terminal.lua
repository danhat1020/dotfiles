local M = {}
local term = { buf = nil, win = nil }

-- ==== HELPERS ====
local function win_is_open(win) return win ~= nil and vim.api.nvim_win_is_valid(win) end
local function buf_is_valid(buf) return buf ~= nil and vim.api.nvim_buf_is_valid(buf) end

-- ==== OPEN/CLOSE ====
local function open_terminal()
  if not buf_is_valid(term.buf) then term.buf = vim.api.nvim_create_buf(false, false) end

  term.win = vim.api.nvim_open_win(term.buf, true, {
    relative = 'editor',
    width    = vim.o.columns,
    height   = vim.o.lines,
    row      = 0,
    col      = 0,
    style    = 'minimal',
    border   = 'none',
    zindex   = 50,
  })

  vim.wo[term.win].number         = false
  vim.wo[term.win].relativenumber = false
  vim.wo[term.win].signcolumn     = 'no'

  if vim.bo[term.buf].buftype ~= 'terminal' then vim.fn.jobstart(vim.o.shell, { term = true }) end

  vim.cmd('startinsert')
end

local function close_terminal()
  vim.api.nvim_win_hide(term.win)
  term.win = nil
end

function M.toggle()
  if win_is_open(term.win) then close_terminal()
  else open_terminal() end
end

local function setup_keymaps()
  vim.keymap.set({ 'n', 't' }, '<C-t>', M.toggle,            { noremap = true, silent = true })
  vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
end

setup_keymaps()
return M
