vim.ui.select = function(items, opts, on_choice)
    local prompt = opts.prompt      or 'Select'
    local fmt    = opts.format_item or tostring

    local lines = {}
    for i, item in ipairs(items) do table.insert(lines, string.format(' %d. %s', i, fmt(item))) end

    local width = #prompt + 4
    for _, l in ipairs(lines) do width = math.max(width, #l + 2) end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
    vim.bo[buf].bufhidden = 'wipe'

    local win = vim.api.nvim_open_win(buf, true, {
        relative  = 'editor',
        width     = width,
        height    = #lines,
        row       = math.floor((vim.o.lines   - #lines) / 2),
        col       = math.floor((vim.o.columns - width)  / 2),
        style     = 'minimal',
        border    = 'single',
        title     = ' ' .. prompt .. ' ',
        title_pos = 'center',
    })
    vim.wo[win].cursorline = true

    local function pick(idx)
        if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
        vim.schedule(function()
            if idx then on_choice(items[idx], idx) else on_choice(nil, nil) end
        end)
    end

    local o = { nowait = true, silent = true, buffer = buf }
    vim.keymap.set('n', '<CR>',  function() pick(vim.api.nvim_win_get_cursor(win)[1]) end, o)
    vim.keymap.set('n', '<Esc>', function() pick(nil) end, o)
    vim.keymap.set('n', '<C-c>', function() pick(nil) end, o)
    vim.keymap.set('n', 'q',     function() pick(nil) end, o)
    for i = 1, math.min(#items, 9) do
        vim.keymap.set('n', tostring(i), function() pick(i) end, o)
    end
end

vim.ui.input = function(opts, on_confirm)
    local prompt  = opts.prompt  or 'Input'
    local default = opts.default or ''
    local width   = math.max(40, #prompt + 6)

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { default })
    vim.bo[buf].bufhidden = 'wipe'

    local win = vim.api.nvim_open_win(buf, true, {
        relative  = 'editor',
        width     = width,
        height    = 1,
        row       = math.floor((vim.o.lines - 3) / 2),
        col       = math.floor((vim.o.columns - width) / 2),
        style     = 'minimal',
        border    = 'single',
        title     = ' ' .. prompt .. ' ',
        title_pos = 'center',
    })

    vim.api.nvim_win_set_cursor(win, { 1, #default })
    vim.cmd('startinsert!')

    local function finish(submit)
        local value = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1]
        if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
        vim.cmd('stopinsert')
        vim.schedule(function()
            on_confirm(submit and (value ~= '' and value or nil) or nil)
        end)
    end

    local o = { silent = true, buffer = buf }
    vim.keymap.set('i', '<CR>',  function() finish(true)  end, o)
    vim.keymap.set('i', '<Esc>', function() finish(false) end, o)
    vim.keymap.set('i', '<C-c>', function() finish(false) end, o)
end
