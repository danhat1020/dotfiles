-- OPTIONS
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.wrap = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.winborder = "rounded"
opt.swapfile = false
opt.undofile = true
opt.path:append("**")
opt.showmode = true
opt.backspace = "indent,eol,start"

-- TABLINE
_G.custom_tabline = function()
  local line = ""
  for i = 1, vim.fn.tabpagenr("$") do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]

    local bufname = ""
    if bufnr and vim.fn.buflisted(bufnr) == 1 then
      bufname = vim.fn.bufname(bufnr) or ""
    end

    local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"

    if i == vim.fn.tabpagenr() then
      line = line .. "%#TabLineSel# " .. filename .. " %#TabLine#"
    else
      line = line .. "%#TabLine# " .. filename .. " "
    end
  end
  return line .. "%#TabLineFill#"
end

function Update_tabline()
  vim.opt.tabline = "%!v:lua.custom_tabline()"
  vim.opt.showtabline = 2
  vim.cmd("highlight TabLineSel guibg=#282828 guifg=#c0c0c0")
  vim.cmd("highlight TabLine guibg=#141414 guifg=#808080")
  vim.cmd("highlight TabLineFill guibg=none")
end
Update_tabline()

-- AUTOCOMMANDS
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_yank_group,
  pattern = "*",
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ async = false, id = args.data.client_id })
      end,
    })
  end,
})
