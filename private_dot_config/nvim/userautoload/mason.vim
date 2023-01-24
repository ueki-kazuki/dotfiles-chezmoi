lua << EOF
require("mason").setup()
local nvim_lsp = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup_handlers({
    function(server_name)
        local opts = {}
        nvim_lsp[server_name].setup(opts)
    end
})
EOF
