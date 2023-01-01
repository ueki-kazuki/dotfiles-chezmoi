" Shell mode{{{
autocmd FileType sh setl autoindent
autocmd FileType sh setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType sh setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType sh setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType sh setl completeopt-=preview
autocmd FileType sh syntax enable
"}}}

