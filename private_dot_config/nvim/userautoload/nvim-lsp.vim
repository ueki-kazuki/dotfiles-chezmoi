"nvim-lsp {{{
" :help lsp
"2022.12.29

lua << EOF
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', 'gf', vim.lsp.buf.formatting)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action)
    vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
    vim.keymap.set('n', 'g]', vim.diagnostic.goto_next)
    end,
})
EOF
" }}}