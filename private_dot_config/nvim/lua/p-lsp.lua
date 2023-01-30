local keymap = vim.keymap
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local diag = vim.diagnostic
local opts = { noremap = true, silent = true }
keymap.set('n', '<space>e', diag.open_float, opts)
keymap.set('n', '[d', diag.goto_prev, opts)
keymap.set('n', ']d', diag.goto_next, opts)
keymap.set('n', '<space>q', diag.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local buffer = vim.lsp.buf
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap.set('n', 'gD', buffer.declaration, bufopts)
    -- keymap.set('n', 'gd', buffer.definition, bufopts)
    keymap.set('n', '<leader>D', buffer.type_definition, vim.tbl_extend('force', bufopts, {desc = "Type Definition"}))
    keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', bufopts)
    keymap.set('n', 'K', buffer.hover, bufopts)
    keymap.set('n', 'gi', buffer.implementation, bufopts)
    keymap.set('n', '<C-k>', buffer.signature_help, bufopts)
    --keymap.set('n', '<leader>wa', buffer.add_workspace_folder, bufopts)
    --keymap.set('n', '<leader>wr', buffer.remove_workspace_folder, bufopts)
    --keymap.set('n', '<leader>wl', function()
    --    print(vim.inspect(buffer.list_workspace_folders()))
    --end, bufopts)
    keymap.set('n', '<leader>rn', buffer.rename, vim.tbl_extend('force', bufopts, { desc = "Rename" }))
    keymap.set('n', '<leader>ca', buffer.code_action, vim.tbl_extend('force', bufopts, { desc = "Action" }))
    keymap.set('n', 'gr', buffer.references, bufopts)
    keymap.set('n', '<leader>F', function() buffer.format { async = true } end, vim.tbl_extend('force', bufopts, { desc = "Format"}))

    -- format on save
    --vim.api.nvim_create_autocmd('BufWritePre', {
    --	group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    --	buffer = bufnr,
    --	callback = function()
    --		buffer.format()
    --	end
    --})
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_flags = {
    capabilities = capabilities,
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}
require('lspconfig')['sumneko_lua'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['gopls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['jsonls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
