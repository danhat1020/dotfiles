local M = {}

local term = { buf = nil, win = nil, fullscreen = false }
local SPLIT_HEIGHT = math.floor(vim.o.lines / 2)

-- ==== HELPERS ====
local function win_is_open(win) return win ~= nil and vim.api.nvim_win_is_valid(win) end
local function buf_is_valid(buf) return buf ~= nil and vim.api.nvim_buf_is_valid(buf) end

-- ==== OPEN/CLOSE ====
local function open_terminal()
  if not buf_is_valid(term.buf) then
    term.buf = vim.api.nvim_create_buf(false, false)
  end
  term.win = vim.api.nvim_open_win(term.buf, true, {
    split  = 'below',
    height = SPLIT_HEIGHT,
  })
  vim.wo[term.win].number         = false
  vim.wo[term.win].relativenumber = false
  vim.wo[term.win].signcolumn     = 'no'
  if vim.bo[term.buf].buftype ~= 'terminal' then
    vim.fn.jobstart(vim.o.shell, { term = true })
  end
  vim.cmd('startinsert')
end

local function close_terminal()
  vim.api.nvim_win_hide(term.win)
  term.win        = nil
  term.fullscreen = false
end

-- ==== TOGGLE ====
function M.toggle()
  if win_is_open(term.win) then close_terminal()
  else open_terminal() end
end

function M.toggle_fullscreen()
  if not win_is_open(term.win) then return end
  term.fullscreen = not term.fullscreen
  vim.api.nvim_win_set_height(
    term.win,
    term.fullscreen and vim.o.lines or SPLIT_HEIGHT
  )
end

-- ==== KEYMAPS ====
local function setup_keymaps()
  local map = function(lhs, rhs) vim.keymap.set({ 'n', 't' }, lhs, rhs, { noremap = true, silent = true }) end
  map('<C-t>', M.toggle)
  map('<C-f>', M.toggle_fullscreen)
  map('<C-h>', '<C-\\><C-n><C-w>h')
  map('<C-j>', '<C-\\><C-n><C-w>j')
  map('<C-k>', '<C-\\><C-n><C-w>k')
  map('<C-l>', '<C-\\><C-n><C-w>l')
end

setup_keymaps()
return M
