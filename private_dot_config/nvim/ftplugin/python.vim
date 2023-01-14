" Python mode{{{
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType python setl completeopt-=preview
autocmd FileType python setl foldmethod=expr
                           \ foldexpr=lsp#ui#vim#folding#foldexpr()
                           \ foldtext=lsp#ui#vim#folding#foldtext()
autocmd FileType python syntax enable
"}}}

