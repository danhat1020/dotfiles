local M = {}

local open_fzf = function(source_cmd, on_select, opts)
  opts = opts or {}
  local tmpfile = vim.fn.tempname()

  -- build full shell command: pipe source into fzf, write results to tmpfile
  local fzf_cmd = string.format(
    '%s | fzf %s %s > %s',
    source_cmd,
    '--color=bw --layout=reverse',
    opts.fzf_args or '',
    tmpfile
  )

  -- floating window dimensions
  local height = math.floor(vim.o.lines * 0.5)
  local row = vim.o.lines - height

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative  = 'editor',
    width     = vim.o.columns,
    height    = height,
    row       = row,
    col       = 0,
    style     = 'minimal',
    border    = 'single',
    title     = opts.title and (' ' .. opts.title .. ' ') or nil,
    title_pos = 'center',
  })

  vim.fn.jobstart(fzf_cmd, {
    term = true,
    on_exit = function()
      vim.api.nvim_win_close(win, true)
      vim.api.nvim_buf_delete(buf, { force = true })
      local ok, lines = pcall(vim.fn.readfile, tmpfile)
      vim.fn.delete(tmpfile)
      if ok and #lines > 0 and lines[1] ~= '' then on_select(lines) end
    end,
  })
  vim.cmd.startinsert()
end

M.find_files = function()
  local source = vim.fn.executable('fd') == 1
    and 'fd --type f --hidden --exclude .git'
    or 'find . -type f -not -path "*/.git/*"'

  open_fzf(source, function(lines) vim.cmd('edit ' .. vim.fn.fnameescape(lines[1])) end, { title = 'Files' })
end

M.help_tags = function()
  -- `helptags` format: tag\tfile\tline  — we only need column 1
  open_fzf("awk '{print $1}' " .. table.concat(vim.tbl_map(function(f)
    return vim.fn.shellescape(f)
  end, vim.api.nvim_get_runtime_file("doc/tags", true)), " "),
  function(lines) vim.cmd("help " .. vim.fn.fnameescape(lines[1])) end,
  { title = "Help Tags", fzf_args = "--preview 'echo {}'" })
end

M.buffers = function()
  local current = vim.fn.bufnr('%')
  local bufs = vim.tbl_filter(function(b)
    return b.bufnr ~= current
  end, vim.fn.getbufinfo({ buflisted = 1 }))
  if #bufs == 0 then
    vim.notify('No listed buffers', vim.log.levels.INFO)
    return
  end

  -- build a list of 'bufnr\tname' so we can resolve by number on select.
  -- which handles unnamed buffers and duplicate basenames gracefully
  local entries = vim.tbl_map(function(b)
    local name = b.name ~= '' and b.name or '[No Name]'
    return string.format('%3d\t%s', b.bufnr, name)
  end, bufs)

  local source = 'printf "%s\\n" ' .. table.concat(vim.tbl_map(vim.fn.shellescape, entries), ' ')

  open_fzf(source, function(lines)
    local bufnr = tonumber(lines[1]:match('%d+'))
    if bufnr then vim.cmd('buffer ' .. bufnr) end
  end, { title = 'Buffers', fzf_args = '--with-nth=2' })
end

M.find_dirs = function()
  local source = vim.fn.executable('fd') == 1
    and 'fd --type d --hidden --exclude .git'
    or 'find . -type d -not -path "*/.git/*"'

  open_fzf(source, function(lines)
    local dir = lines[1]
    vim.cmd('Explore ' .. vim.fn.fnameescape(dir))
  end, { title = 'Directories' })
end

vim.keymap.set('n', '<leader>f', M.find_files)
vim.keymap.set('n', '<leader>h', M.help_tags)
vim.keymap.set('n', '<leader>b', M.buffers)
vim.keymap.set('n', '<leader>d', M.find_dirs)

return M
