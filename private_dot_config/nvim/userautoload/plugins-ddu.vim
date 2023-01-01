" ddu
" 2022/12/23
" https://zenn.dev/shougo/articles/ddu-vim-beta
" https://zenn.dev/arccosine/articles/39ea605f99b7b5
" https://github.com/Shougo/ddu-ui-ff/blob/main/doc/ddu-ui-ff.txt
call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'sources': [
    \     {'name': 'file_rec',
    \      'params': {
    \        'ignoredDirectories': [
    \          '.git','node_modules', 'vendor', '.next'
    \        ]
    \     }},
    \     {'name':'mr'},
    \     {'name':'register'},
    \     {'name':'buffer'},
    \   ],
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \     },
    \   },
    \   'filterParams': {
    \     'matcher_substring': {
    \       'highlightMatched': 'Title',
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \   },
    \   'uiParams': {
    \     'ff': {
    \       'startFilter': v:false,
    \       'prompt': '> ',
    \       'split': 'horizontal',
    \     }
    \   },
    \ })

call ddu#custom#patch_global({
    \   'ui': 'filer',
    \   'sources': [{'name': 'file', 'params': {}}],
    \   'sourceOptions': {
    \     '_': {
    \       'columns': ['filename', 'icon_filename'],
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \   }
    \ })

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> /
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <CR>
        \ <Cmd>close<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>close<CR>
  nnoremap <buffer> j
        \ <Cmd>call ddu#ui#ff#execute("call cursor(line('.')+1,0)")<CR>
  nnoremap <buffer> k
        \ <Cmd>call ddu#ui#ff#execute("call cursor(line('.')-1,0)")<CR>
  inoremap <buffer> <C-j>
        \ <Cmd>call ddu#ui#ff#execute("call cursor(line('.')+1,0)")<CR>
  inoremap <buffer> <C-k>
        \ <Cmd>call ddu#ui#ff#execute("call cursor(line('.')-1,0)")<CR>
endfunction


""" ddu-filer keymap
" https://alpacat.com/blog/ddu-ui-filer
autocmd TabEnter,CursorHold,FocusGained <buffer>
    \ call ddu#ui#filer#do_action('checkItems')

autocmd FileType ddu-filer call s:ddu_filer_my_settings()
function! s:ddu_filer_my_settings() abort
  nnoremap <buffer><silent><expr> <CR>
    \ ddu#ui#filer#is_tree() ?
    "\ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    "\ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>"
    \ "<Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {}})<CR>"

  nnoremap <buffer><silent><expr> <Space>
    \ ddu#ui#filer#is_tree() ?
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>"

  nnoremap <buffer><silent> <Esc>
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>

  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>

  nnoremap <buffer><silent> ^
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>

  nnoremap <buffer><silent> c
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'copy'})<CR>

  nnoremap <buffer><silent> cd
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'cd'})<CR>

  nnoremap <buffer><silent> p
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'paste'})<CR>

  nnoremap <buffer><silent> D
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'delete'})<CR>

  nnoremap <buffer><silent> R
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>

  nnoremap <buffer><silent> m
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'move'})<CR>

  nnoremap <buffer><silent> %
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>

  nnoremap <buffer><silent> K
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newDirectory'})<CR>

  nnoremap <buffer><silent> yy
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'yank'})<CR>
endfunction

"augroup ddu
"    au!
"    au VimEnter * sil! au! FileExplorer *
"    au BufEnter * if s:isdir(expand('%')) | bd | call ddu#start() | endif
"augroup END
"
