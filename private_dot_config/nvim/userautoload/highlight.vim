set termguicolors
"colorscheme japanesque
colorscheme tokyonight-moon

" highlight{{{
" https://www.ditig.com/256-colors-cheat-sheet
" アンダーラインを引く(color terminal)
highlight CursorLine   cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE

" 行番号
" highlight LineNr       term=underline  ctermfg=130  ctermbg=None gui=NONE guifg=Brown
" highlight CursorLineNr cterm=bold      ctermfg=255  ctermbg=130  gui=bold      guifg=Brown

" Error
highlight Error ctermbg=darkred guibg=white

" Inactive Buffer
highlight ColorColumn ctermfg=gray ctermbg=NONE

" Popup Menu
highlight Pmenu       ctermfg=255 ctermbg=240 guifg=fg guibg=Grey
highlight PmenuSel    ctermfg=255 ctermbg=28  guifg=fg guibg=#d05a6e
highlight PmenuSbar   ctermbg=248
highlight PmenuThumb  ctermbg=15
highlight NormalFloat ctermfg=255 ctermbg=0
highlight Visual      ctermfg=255 ctermbg=0

" Wherekey
"
highlight WhichKeyFloating ctermfg=255 ctermbg=0
highlight WhichKeyTrigger  ctermfg=232 ctermbg=178 guifg=#333300 guibg=#ffbb7d
highlight WhichKeyName     ctermfg=171 ctermbg=239 guifg=#d75fd7 guibg=#4e4e4e
"}}}
