vim.cmd('colorscheme default')
require('tokyonight').setup({
	style = 'moon',
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},

})
-- vim.cmd('colorscheme tokyonight')
vim.cmd('colorscheme everforest')
