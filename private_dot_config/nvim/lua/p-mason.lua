require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		'sumneko_lua',
		'gopls',
		'pyright',
		'rust_analyzer',
	},
	automatic_install = true,
}
