-- =============================================================================
-- File:        silence.lua
-- Description: Neovim color scheme (adjusted from zazen.vim)
-- Original:    Zoltan Dezso
-- =============================================================================

vim.cmd("set background=dark")
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "silence"

vim.o.termguicolors = true
vim.cmd([[let &t_Au = "\e[58:2::%lu:%lu:%lum"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_8u = "\e[58:5:%lum"]])

local hi = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

-- Core UI
hi("Normal",       { fg = "#a0a0a0",                        })
hi("NormalFloat",  {                 bg = "none"            })
hi("FloatBorder",  { fg = "#808080", bg = "none"            })
hi("CursorLine",   {                 bg = "#181818",        })
hi("CursorColumn", {                 bg = "#1a1a1a",        })
hi("LineNr",       { fg = "#b0b0b0",                        })
hi("LineNrAbove",  { fg = "#555555",                        })
hi("LineNrBelow",  { fg = "#555555",                        })
hi("ColorColumn",  {                 bg = "#222222",        })
hi("Cursor",       { reverse = true                         })
hi("CursorIM",     { reverse = true                         })
hi("lCursor",      { reverse = true                         })
hi("Visual",       { fg = "#70a8b0", bg = "#202020",        })
hi("EndOfBuffer",  { fg = "#404040",                        })
hi("VertSplit",    { fg = "#222222", bg = "#222222",        })

-- Syntax
hi("Statement",    { fg = "#a0a0a0",                        })
hi("Function",     { fg = "#a0a0a0",                        })
hi("String",       { fg = "#7098a0",                        })
hi("Type",         { fg = "#909098",                        })
hi("Conditional",  { fg = "#787878",                        })
hi("Comment",      { fg = "#d0d0e0",                        })
hi("Todo",         { fg = "#000000", bg = "#d0d0e0", bold = true })
hi("Special",      { fg = "#888888",                        })
hi("Delimiter",    { fg = "#707070",                        })
hi("Identifier",   { fg = "#a0a0a0",                        })
hi("Keyword",      { fg = "#666666",                        })
hi("PreProc",      { fg = "#9090a0",                        })
hi("Include",      { fg = "#9090a0",                        })
hi("Constant",     { fg = "#a890d0",                        })
hi("Boolean",      { fg = "#616060",                        })
hi("Ignore",       { fg = "none",                           })

hi("@lsp.type.variable", { fg = "#b0b0b8",                })
hi("@lsp.type.parameter", { fg = "#9098c8",                })

-- Popup menu
hi("Pmenu",        { fg = "#505050", bg = "none",           })
hi("PmenuSel",     { fg = "#e0e0e0", bg = "#101010",        })
hi("PmenuSbar",    {                 bg = "#101010",        })
hi("PmenuThumb",   {                 bg = "#606060",        })

-- Diff
hi("DiffAdd",      { fg = "#00cc00", bg = "#002200",        })
hi("DiffChange",   { fg = "#ff9955", bg = "#220000",        })
hi("DiffDelete",   { fg = "#ff0000", bg = "#220000",        })
hi("DiffText",     { fg = "#ff0000", bg = "#220000",        })

-- Search & matching
hi("IncSearch",    { fg = "#000000", bg = "#c0a080",        })
hi("Search",       { fg = "#000000", bg = "#c5c3c3",        })
hi("MatchParen",   { fg = "#e0e0e0", bg = "#343434",        })

-- Statusline & tabs
hi("StatusLine",   { fg = "#c0c0c0", bg = "#1a1a1a",        })
hi("StatusLineNC", { fg = "#606060", bg = "#101010",        })
hi("TabLine",      { fg = "#505050", bg = "#757575", underline = true })
hi("TabLineFill",  { fg = "#505050", bg = "none",     reverse = true   })
hi("TabLineSel",   { fg = "#505050", bg = "none",              })

-- Diagnostics & messages
hi("ErrorMsg",     { fg = "#d07070", bold = true       })
hi("WarningMsg",   { fg = "#d0b070", bold = true       })
hi("ModeMsg",      { fg = "#ffffff",                   })
hi("MoreMsg",      { fg = "#7c7c7c",                   })
hi("Question",     { fg = "#454545",                   })
hi("Error",        { fg = "#d07070", underline = true, sp = "#d07070" })

-- Folds
hi("FoldColumn",   { fg = "#555555", bg = "#414141",        })
hi("Folded",       { fg = "#828282", bg = "#212121",        })

-- Misc
hi("Directory",    { fg = "#7090b0",                        })
hi("NonText",      { fg = "#7e7e7e",                        })
hi("SpecialKey",   { fg = "#454545",                        })
hi("SignColumn",   { fg = "#a0a0a0", bg = "none",           })
hi("Title",        { fg = "#6d6d6d",                        })
hi("WildMenu",     { fg = "#000000", bg = "#828282",        })
hi("Operator",     { fg = "#a0a0a0", bg = "none",           })

-- Spell
hi("SpellBad",     { bg = "#000000", sp = "#ffc0c0", undercurl = true })
hi("SpellCap",     { sp = "#5d5d5d", undercurl = true       })
hi("SpellLocal",   { sp = "#434343", undercurl = true       })
hi("SpellRare",    { sp = "#7d7d7d", undercurl = true       })

-- Quickfix
hi("qfFileName",   { fg = "#6a6a6a",            italic = true })
hi("qfLineNr",     { fg = "#505050",                             })
hi("qfError",      { fg = "#505050",    bg = "#000000", underline = true })

-- Taglist
hi("MyTagListFileName", { fg = "#ffffff", bg = "#444444"   })
hi("MyTagListTitle",    { fg = "#666666",                  })

-- Vim-specific
hi("VimError",     { fg = "#b6b6b6", bg = "#313131",       })

-- Links
vim.api.nvim_set_hl(0, "VimCommentTitle", { link = "Comment" })
vim.api.nvim_set_hl(0, "netrwMarkFile",   { link = "IncSearch" })

-- Diagnostic highlights
hi('DiagnosticError',          { fg='#d07070',    bg='none'      })
hi('DiagnosticWarn',           { fg='#d0b070',    bg='none'      })
hi('DiagnosticInfo',           { fg='#70a0d0',    bg='none'      })
hi('DiagnosticHint',           { fg='#a0b0d0',    bg='none'      })
hi('DiagnosticUnderlineError', {                  bg='none',     underline = true, sp = '#d07070' })
hi('DiagnosticUnderlineWarn',  {                  bg='none',     underline = true, sp = '#d0b070' })
hi('DiagnosticUnderlineInfo',  {                  bg='none',     underline = true, sp = '#70a0d0' })
hi('DiagnosticUnderlineHint',  {                  bg='none',     underline = true, sp = '#a0b0d0' })
