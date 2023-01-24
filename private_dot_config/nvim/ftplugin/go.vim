" Golang{{{
" 2016/08/08
autocmd FileType go setl autoindent
autocmd FileType go setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType go setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType go setl list listchars=tab:.\ ,eol:\ ,trail:_
autocmd FileType go setl completeopt-=preview
autocmd FileType go syntax enable
"}}}

echo "Hello Golang"
