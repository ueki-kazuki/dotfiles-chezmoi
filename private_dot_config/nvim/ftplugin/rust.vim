" Rust {{{
autocmd FileType rust setl autoindent
autocmd FileType rust setl smartindent
autocmd FileType rust setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType rust setl list listchars=tab:>-,eol:\ ,trail:_
autocmd FileType rust setl completeopt-=preview
autocmd FileType rust setl tagfunc=lsp#tagfunc
autocmd FileType rust syntax enable

"}}}

" rust-vim
" https://github.com/rust-lang/rust.vim
" 2022/12/28
let g:rustfmt_autosave = 1
