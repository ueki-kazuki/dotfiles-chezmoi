" Customize global settings

" You must set the default ui.
" Note: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')

" Use around source.
" https://github.com/Shougo/ddc-source-around
" https://github.com/Shougo/ddc-source-nvim-lsp
call ddc#custom#patch_global('sources', ['around', 'nvim-lsp'])
" call ddc#custom#patch_global('sources', ['around', 'vim-lsp'])
" call ddc#custom#patch_global('sources', ['around', 'nvim-lsp', 'vim-lsp'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', #{
      \ _: #{
      \   matchers: ['matcher_head'],
      \   sorters: ['sorter_rank']},
      \
      \ around: #{ mark: 'A' },
      \
      \ nvim-lsp: #{
      \   mark: 'lsp',
      \   forceCompletionPattern: '\.\w*|:\w*|->\w*' },
      \
      \ vim-lsp: #{
      \   mark: 'lsp',
      \   forceCompletionPattern: '\.\w*|:\w*|->\w*',
      \   matchers: ['matcher_head'] },
      \ })
call ddc#custom#patch_global('sourceParams', #{
      \   around: #{ maxSize: 500 },
      \   nvim-lsp: #{ kindLabels: #{ Class: 'c' } },
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources',
      \ ['around', 'clangd'])
call ddc#custom#patch_filetype(['rust'], 'sources',
      \ ['rust-analyzer'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', #{
      \   clangd: #{ mark: 'C' },
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', #{
      \   around: #{ maxSize: 100 },
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
     \ pumvisible() ? '<C-n>' :
     \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
     \ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
