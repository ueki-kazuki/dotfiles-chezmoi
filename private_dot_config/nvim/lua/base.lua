-- https://www.chiarulli.me/Neovim/02-vim-general-settings/
vim.scriptencoding = "utf-8" -- The encoding written to file

local opt = vim.opt

-- set termguicolors to enable highlight groups
opt.termguicolors  = true
opt.syntax.enable  = true
opt.hidden         = true -- Required to keep multiple buffers open multiple buffers
opt.wrap           = false -- Display long lines as just one line
opt.encoding       = "utf-8" -- The encoding displayed
opt.pumheight      = 10 -- Makes popup menu smaller
opt.fileencoding   = "utf-8" -- The encoding written to file
opt.ruler          = true -- Show the cursor position all the time
opt.cmdheight      = 2 -- More space for displaying messages
opt.mouse          = "a" -- Enable your mouse
opt.splitbelow     = true -- Horizontal splits will automatically be below
opt.splitright     = true -- Vertical splits will automatically be to the right
-- opt.t_Co=256                   -- Support 256 colors
opt.conceallevel   = 0 -- So that I can see `` in markdown files
opt.tabstop        = 4 -- Insert 2 spaces for a tab
opt.softtabstop    = 4 -- Insert 2 spaces for a tab
opt.shiftwidth     = 4 -- Change the number of space characters inserted for indentation
opt.smarttab       = true -- Makes tabbing smarter will realize you have 2 vs 4
opt.expandtab      = true -- Converts tabs to spaces
opt.smartindent    = true -- Makes indenting smart
opt.autoindent     = true -- Good auto indent
opt.laststatus     = 0 -- Always display the status line
opt.number         = true -- Line numbers
opt.relativenumber = false
opt.cursorline     = true -- Enable highlighting of the current line
opt.background     = "dark" -- tell vim what the background color looks like
opt.showtabline    = 4 -- Always show tabs
opt.showmode       = false -- We don't need to see things like -- INSERT -- anymore
opt.backup         = false -- This is recommended by coc
opt.writebackup    = false -- This is recommended by coc
opt.updatetime     = 300 -- Faster completion
opt.timeoutlen     = 500 -- By default timeoutlen is 1000 ms
opt.clipboard      = "unnamedplus" -- Copy paste between vim and everything else
opt.autochdir      = true -- Your working directory will always be the same as your working directory
opt.scrolloff      = 5
opt.sidescrolloff  = 5
opt.hlsearch       = true
opt.incsearch      = true
opt.ignorecase     = false
opt.smartcase      = true
opt.swapfile       = false
opt.iskeyword:append("-") -- treat dash separated words as a word text object"
opt.formatoptions:append("cro") -- Stop newline continution of comments


vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 300,
        })
    end
})
