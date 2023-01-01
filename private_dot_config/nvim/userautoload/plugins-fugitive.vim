" Find {{{
set path+=**
set wildmenu
set wildignore+=*.pyc,**/.venv/**,**/__pycache__/**
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**
set hidden
" }}}

" Git (fugitive){{{
nnoremap <leader>Gs :tab split<CR>:Gstatus<CR>:only<CR>
nnoremap <leader>Ga :Gwrite<CR>
nnoremap <leader>Gc :Gcommit<CR>
nnoremap <leader>Gb :Gblame<CR>
nnoremap <leader>Gl :Git log<CR>
nnoremap <leader>Gh :tab sp<CR>:0Glog<CR>
nnoremap <leader>Gp :Gpush<CR>
nnoremap <leader>Gf :Gfetch<CR>
nnoremap <leader>Gd :Gvdiff<CR>
nnoremap <leader>Gr :Grebase -i<CR>
nnoremap <leader>Gg :Ggrep
nnoremap <leader>Gm :Gmerge
"}}}

