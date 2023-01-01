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

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = '/home/uekikazuki/.local/share/dein'

" Set Dein source path (required)
let s:dein_src = '/home/uekikazuki/.local/share/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

  call dein#add(s:dein_src)

  """
  " ddu
  call dein#add('vim-denops/denops.vim')
  call dein#add('Shougo/ddu.vim')
  " ddu-ui
  call dein#add('Shougo/ddu-ui-ff')
  call dein#add('Shougo/ddu-ui-filer')
  " ddu-source
  call dein#add('Shougo/ddu-source-file')
  call dein#add('Shougo/ddu-source-file_rec')
  call dein#add('Shougo/ddu-source-register')
  call dein#add('kuuote/ddu-source-mr')
  call dein#add('lambdalisue/mr.vim')
  call dein#add('shun/ddu-source-buffer')
  " ddu-kind, ddu-filter
  call dein#add('Shougo/ddu-filter-matcher_substring')
  call dein#add('Shougo/ddu-kind-file')
  call dein#add('Shougo/ddu-commands.vim')
  call dein#add('Shougo/ddu-column-filename')
  call dein#add('ryota2357/ddu-column-icon_filename')

  """
  " ddc
  call dein#add('Shougo/ddc.vim')
  call dein#add('Shougo/ddc-ui-native')
  call dein#add('Shougo/ddc-source-around')
  call dein#add('Shougo/ddc-source-nvim-lsp')
  " call dein#add('shun/ddc-source-vim-lsp')
  call dein#add('Shougo/ddc-matcher_head')
  call dein#add('Shougo/ddc-sorter_rank')
  call dein#add('Shougo/pum.vim')

  """
  " airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  """
  " language server
  " call dein#add('prabirshrestha/vim-lsp')
  " call dein#add('mattn/vim-lsp-settings')
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('williamboman/mason.nvim')
  call dein#add('williamboman/mason-lspconfig.nvim')

  """
  " other plugin
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('rust-lang/rust.vim')

" Finish Dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" Leader{{{
" https://vim-jp.org/vimdoc-ja/map.html#:map-arguments
" 2021/01/05
let mapleader = "\<Space>"
let maplocalleader = ","
nnoremap <silent> <Leader>m :<C-u>Ddu mr<CR>
nnoremap <silent> <C-t><C-t> :<C-u>Ddu buffer<CR>
nnoremap <silent> <C-t>t     :<C-u>Ddu buffer<CR>
nnoremap <silent> <Leader>r :<C-u>Ddu register<CR>
nnoremap <silent> <Leader>n :<C-u>Ddu file_rec -source-param-new -volatile<CR>
nnoremap <silent> <Leader>f <Cmd>call ddu#start({
\   'name': 'filer',
\   'uiParams': {'filer': {'search': expand('%:p')}},
\ })<CR>
"nnoremap <silent> <Leader>f :<C-u>Ddu file_rec<CR>
nnoremap <silent> <C-t><C-p>   :<C-u>bprev<CR>
nnoremap <silent> <C-t><C-n>   :<C-u>bnext<CR>
nnoremap <silent> <C-t>p       :<C-u>bprev<CR>
nnoremap <silent> <C-t>n       :<C-u>bnext<CR>
nnoremap <silent> <Leader>y "+y
vnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>d "+d
vnoremap <silent> <Leader>d "+d
nnoremap <silent> <Leader>p "+p
nnoremap <silent> <Leader>P "+P
vnoremap <silent> <Leader>p "+p
vnoremap <silent> <Leader>P "+P
" }}}

runtime! userautoload/*.vim

