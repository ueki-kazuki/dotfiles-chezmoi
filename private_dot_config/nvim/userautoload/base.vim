" 別のバッファーに移る時に保存を確認してこないようにする
set hidden
" カレント行ハイライト
set cursorline
" 行番号を表示する
set number
" InsertModeになる際にカーソル位置を画面中央にする
autocmd InsertEnter * norm zz
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Terminal mode
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * setlocal statusline=%{b:term_title}
" Tabstop
set tabstop=4
set softtabstop=4

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

