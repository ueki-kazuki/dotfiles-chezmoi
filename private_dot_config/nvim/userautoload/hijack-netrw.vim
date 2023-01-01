" https://github.com/lambdalisue/fern-hijack.vim/blob/master/plugin/fern_hijack.vim
function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  let bufnr = bufnr()
  execute printf("keepjumps keepalt call ddu#start({ 'name': 'filer', 'uiParams': {'filer': {'search': '%s'}} })", fnameescape(path))
  execute printf('silent! bwipeout %d', bufnr)
endfunction

function! s:suppress_netrw() abort
  if exists('#FileExplorer')
    autocmd! FileExplorer *
  endif
endfunction

function! s:expand(expr) abort
  try
    return fern#util#expand(a:expr)
  catch /^Vim\%((\a\+)\)\=:E117:/
    return expand(a:expr)
  endtry
endfunction

augroup ddu-filer-hijack
  autocmd!
  autocmd VimEnter * call s:suppress_netrw()
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END
