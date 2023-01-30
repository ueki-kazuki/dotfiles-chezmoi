local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = "Files" })
-- vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = "Grep" })
-- vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "Buffers" })
-- vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = "Tags" })
-- vim.keymap.set('n', '<leader>m', builtin.oldfiles, { desc = "Recent" })
-- vim.keymap.set('n', '<leader>r', builtin.registers, { desc = "Registers" })
vim.keymap.set('n', '<C-t><C-t>', builtin.buffers, {})
vim.keymap.set('n', '<leader>G', '<Cmd>Telescope ghq list<CR>', { desc = "Ghq" })

require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        --
    }
}
