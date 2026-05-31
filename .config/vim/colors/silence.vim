" colors/silence.vim

hi clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'silence'

" Config — set these in your vimrc before colorscheme silence
let g:silence_transparent     = get(g:, 'silence_transparent',     0)
let g:silence_bold            = get(g:, 'silence_bold',            1)
let g:silence_darker_comments = get(g:, 'silence_darker_comments', 0)

" Colors
let s:none       = 'NONE'
let s:bg         = '#0c0c0c'
let s:black      = '#080808'
let s:grey0      = '#141414'
let s:grey1      = '#1b1b1b'
let s:grey2      = '#222222'
let s:grey3      = '#404040'
let s:grey4      = '#555555'
let s:grey5      = '#666666'
let s:grey6      = '#707070'
let s:grey7      = '#888888'
let s:grey8      = '#a0a0a0'
let s:grey9      = '#b0b0b0'
let s:grey10     = '#c0c0c0'
let s:white      = '#d0d0d0'
let s:red        = '#d070a0'
let s:yellow     = '#d0b8a0'
let s:blue       = '#6090d0'
let s:light_blue = '#90a0d0'
let s:string     = '#7098a0'
let s:constant   = '#a890d0'
let s:incsearch  = '#b0b0c0'
let s:matchparen = '#b8c0e0'
let s:type       = '#90939b'
let s:preproc    = '#9090a0'

if g:silence_transparent | let s:bg = 'NONE' | endif
let s:comments = g:silence_darker_comments ? s:grey6 : s:white
let s:bold     = g:silence_bold ? 'bold' : ''

" Helper — filters empty strings so 'reverse,' doesn't become 'reverse,NONE'
function! s:Hi(group, fg, bg, gui, sp)
  let l:cmd  = 'hi ' . a:group
  if a:fg != '' | let l:cmd .= ' guifg=' . a:fg | endif
  if a:bg != '' | let l:cmd .= ' guibg=' . a:bg | endif
  let l:gui  = filter(split(a:gui, ','), 'v:val != ""')
  let l:cmd .= ' gui=' . (!empty(l:gui) ? join(l:gui, ',') : 'NONE')
  if a:sp != '' | let l:cmd .= ' guisp=' . a:sp | endif
  execute l:cmd
endfunction

" Core UI
call s:Hi('Normal',       s:grey8,      s:bg,     'NONE',            '')
call s:Hi('CursorLine',   s:none,       s:grey0,  'NONE',            '')
call s:Hi('CursorLineNr', s:none,       s:grey0,  'NONE',            '')
call s:Hi('CursorColumn', s:none,       s:grey0,  'NONE',            '')
call s:Hi('LineNr',       s:grey9,      s:bg,     'NONE',            '')
call s:Hi('LineNrAbove',  s:grey4,      s:bg,     'NONE',            '')
call s:Hi('LineNrBelow',  s:grey4,      s:bg,     'NONE',            '')
call s:Hi('ColorColumn',  s:none,       s:black,  'NONE',            '')
call s:Hi('Cursor',       '',           '',       'reverse,'.s:bold, '')
call s:Hi('CursorIM',     '',           s:bg,     'reverse',         '')
call s:Hi('lCursor',      '',           s:bg,     'reverse',         '')
call s:Hi('Visual',       s:string,     s:grey2,  'NONE',            '')
call s:Hi('EndOfBuffer',  s:grey3,      s:bg,     'NONE',            '')
call s:Hi('VertSplit',    s:grey2,      s:grey2,  'NONE',            '')

" Syntax
call s:Hi('Statement',    s:grey8,      s:bg,     'NONE',            '')
call s:Hi('Function',     s:grey8,      s:bg,     'NONE',            '')
call s:Hi('String',       s:string,     s:bg,     'NONE',            '')
call s:Hi('Type',         s:type,       s:bg,     'NONE',            '')
call s:Hi('Conditional',  s:grey7,      s:bg,     'NONE',            '')
call s:Hi('Comment',      s:comments,   s:bg,     'NONE',            '')
call s:Hi('Todo',         s:black,      s:comments, s:bold,          '')
call s:Hi('Special',      s:grey7,      s:bg,     'NONE',            '')
call s:Hi('Delimiter',    s:grey5,      s:bg,     'NONE',            '')
call s:Hi('Identifier',   s:grey8,      s:bg,     'NONE',            '')
call s:Hi('Keyword',      s:grey5,      s:bg,     'NONE',            '')
call s:Hi('PreProc',      s:preproc,    s:bg,     'NONE',            '')
call s:Hi('Include',      s:preproc,    s:bg,     'NONE',            '')
call s:Hi('Constant',     s:constant,   s:bg,     'NONE',            '')
call s:Hi('Boolean',      s:grey5,      s:bg,     'NONE',            '')
call s:Hi('Ignore',       s:none,       s:bg,     'NONE',            '')
call s:Hi('Operator',     s:grey8,      s:bg,     'NONE',            '')

" Popup menu
call s:Hi('Pmenu',        s:grey5,      s:bg,     'NONE',            '')
call s:Hi('PmenuSel',     s:white,      s:black,  s:bold,            '')
call s:Hi('PmenuSbar',    s:none,       s:black,  'NONE',            '')
call s:Hi('PmenuThumb',   s:none,       s:grey3,  'NONE',            '')

" Search & matching
call s:Hi('IncSearch',    s:incsearch,  s:black, 'NONE',         '')
call s:Hi('Search',       s:black,      s:white,  'NONE',            '')
call s:Hi('MatchParen',   s:matchparen, s:grey3,  s:bold,            '')

" Statusline & tabs
call s:Hi('StatusLine',   s:grey10,     s:grey2,  'NONE',            '')
call s:Hi('StatusLineNC', s:grey5,      s:grey1,  'NONE',            '')
call s:Hi('TabLine',      s:grey4,      s:grey6,  'underline',       '')
call s:Hi('TabLineFill',  s:grey4,      s:bg,     'reverse',         '')
call s:Hi('TabLineSel',   s:grey4,      s:bg,     'NONE',            '')

" Messages & dialogs
call s:Hi('ErrorMsg',     s:red,        s:bg,     s:bold,            '')
call s:Hi('WarningMsg',   s:yellow,     s:bg,     s:bold,            '')
call s:Hi('ModeMsg',      s:grey10,     s:bg,     'NONE',            '')
call s:Hi('MoreMsg',      s:grey7,      s:bg,     'NONE',            '')
call s:Hi('Question',     s:grey4,      s:bg,     'NONE',            '')
call s:Hi('Error',        s:red,        '',       'underline',       s:red)

" Folds
call s:Hi('FoldColumn',   s:grey4,      s:grey3,  'NONE',            '')
call s:Hi('Folded',       s:grey7,      s:grey2,  'NONE',            '')

" Misc
call s:Hi('Directory',    s:blue,       s:bg,     'NONE',            '')
call s:Hi('NonText',      s:grey7,      s:bg,     'NONE',            '')
call s:Hi('SpecialKey',   s:grey3,      s:bg,     'NONE',            '')
call s:Hi('SignColumn',   s:grey8,      s:bg,     'NONE',            '')
call s:Hi('Title',        s:grey6,      s:bg,     'NONE',            '')
call s:Hi('WildMenu',     s:black,      s:grey7,  'NONE',            '')

" Spell
call s:Hi('SpellBad',     '',           s:black,  'underline',       s:red)
call s:Hi('SpellCap',     '',           '',       'underline',       s:grey4)
call s:Hi('SpellLocal',   '',           '',       'underline',       s:grey3)
call s:Hi('SpellRare',    '',           '',       'underline',       s:grey6)

" Quickfix
call s:Hi('qfFileName',   s:grey5,      s:bg,     'italic',          '')
call s:Hi('qfLineNr',     s:grey4,      s:bg,     'NONE',            '')
call s:Hi('qfError',      s:grey4,      s:black,  'underline',       '')

" Taglist
call s:Hi('MyTagListFileName', s:grey10, s:grey3, 'NONE',            '')
call s:Hi('MyTagListTitle',    s:grey5,  s:bg,    'NONE',            '')

" Vim-specific
call s:Hi('VimError',     s:grey10,     s:grey3,  'NONE',            '')

" Clear C paren error highlight (overrides default)
hi cErrInParen NONE

" Links
hi! link VimCommentTitle Comment
hi! link netrwMarkFile   IncSearch

" Terminal colors (Vim 8+)
let g:terminal_color_0  = s:black
let g:terminal_color_1  = s:red
let g:terminal_color_2  = s:string
let g:terminal_color_3  = s:yellow
let g:terminal_color_4  = s:blue
let g:terminal_color_5  = s:constant
let g:terminal_color_6  = s:string
let g:terminal_color_7  = s:grey8
let g:terminal_color_8  = s:grey3
let g:terminal_color_9  = s:red
let g:terminal_color_10 = s:string
let g:terminal_color_11 = s:yellow
let g:terminal_color_12 = s:blue
let g:terminal_color_13 = s:constant
let g:terminal_color_14 = s:light_blue
let g:terminal_color_15 = s:white
