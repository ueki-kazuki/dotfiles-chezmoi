set laststatus=2
set showtabline=2 " 常にタブラインを表示
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#alt_sep = 1
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#bufferline#enabled = 1
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
if !has('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = "\u33c7"
"let g:Powerline_symbols = 'fancy'
