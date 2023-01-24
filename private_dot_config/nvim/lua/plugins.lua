-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Lsp
    use 'neovim/nvim-lspconfig'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }
    -- Filer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    -- colorscheme
    use 'folke/tokyonight.nvim'
    use 'sainnhe/everforest'

    -- Text
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'rmagatti/alternate-toggler'
    use 'jiangmiao/auto-pairs'
    use 'mg979/vim-visual-multi'

    -- statusline
    use 'nvim-lualine/lualine.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-ghq.nvim',
        },
        config = function()
            require('telescope').load_extension('ghq')
        end,
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use {
        'akinsho/toggleterm.nvim',
        tag = '*'
    }
    -- Packer
    use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                -- add any options here
            })
        end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    })
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
