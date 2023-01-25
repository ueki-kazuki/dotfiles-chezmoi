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
vim.cmd('let g:everforest_enable_italic = 0')
vim.cmd('let g:everforest_disable_italic_comment = 1')
vim.cmd('let g:everforest_transparent_background = 1')
vim.cmd('let g:everforest_better_performance = 1')

vim.cmd('colorscheme everforest')

