-- set leader key
-- vim.g.mapleader = "<Space>"
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-t><C-p>', ':<C-u>bprev<CR>', opts)
vim.keymap.set('n', '<C-t><C-n>', ':<C-u>bnext<CR>', opts)
vim.keymap.set('n', '<C-t>p', ':<C-u>bprev<CR>', opts)
vim.keymap.set('n', '<C-t>n', ':<C-u>bnext<CR>', opts)
