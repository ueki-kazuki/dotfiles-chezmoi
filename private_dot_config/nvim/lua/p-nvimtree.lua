-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    actions = {
        open_file = { quit_on_open = true },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "<C-e>", action = "close" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    sync_root_with_cwd = false,
})

vim.keymap.set('n', '<C-e>', '<Cmd>NvimTreeToggle<CR>')
