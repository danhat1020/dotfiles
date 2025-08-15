local function get_git_branch()
    local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
    return branch ~= "" and "  " .. branch or ""
end
local mode_map = {
    ['n'] = { label = 'NORMAL', color = '#569cd6' },
    ['i'] = { label = 'INSERT', color = '#d8a657' },
    ['v'] = { label = 'VISUAL', color = '#c678dd' },
    ['V'] = { label = 'V-LINE', color = '#c678dd' },
    [''] = { label = 'V-BLOCK', color = '#c678dd' },
    ['R'] = { label = 'REPLACE', color = '#d16969' },
    ['c'] = { label = 'COMMAND', color = '#4ec9b0' },
    ['t'] = { label = 'TERMINAL', color = '#4ec9b0' },
}
local update_statusline = function()
    local mode = vim.api.nvim_get_mode().mode
    local current_mode = mode_map[mode] or { label = mode, color = '#d4d4d4' }
    -- Build statusline without string.format
    vim.opt.statusline = ""
        .. "%#StatusLineMode#" .. " " .. current_mode.label .. " " .. "%#StatusLine#"
        .. " %t%m%r"
        .. "%#StatusLineNC#"
        .. "%=%{&fileencoding} %{&fileformat} %y" .. get_git_branch()
        .. " %#StatusLine#"
        .. " %l:%c %P"
end
vim.api.nvim_create_autocmd({ 'ModeChanged', 'BufEnter' }, {
    callback = update_statusline
})
update_statusline()
vim.cmd([[
  highlight StatusLine      guibg=NONE guifg=#c0c0c0 gui=bold
  highlight StatusLineNC    guibg=NONE guifg=#6e6a86
  highlight StatusLineMode  guibg=NONE guifg=#3c63f0 gui=bold
  augroup ModeColors
    autocmd!
    autocmd ModeChanged *:[n]* hi! StatusLineMode guifg=#3c63f0
    autocmd ModeChanged *:[i]* hi! StatusLineMode guifg=#ab3cf0
    autocmd ModeChanged *:[vV]* hi! StatusLineMode guifg=#f03c6f
    autocmd ModeChanged *:[R]* hi! StatusLineMode guifg=#f0603c
    autocmd ModeChanged *:[c]* hi! StatusLineMode guifg=#3caef0
    autocmd ModeChanged *:[t]* hi! StatusLineMode guifg=#08c918
  augroup END
]])
