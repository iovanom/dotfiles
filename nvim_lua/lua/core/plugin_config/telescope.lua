local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
      },
    },
    mappings = {
      i = {
        ["<C-j>"] = {
          actions.move_selection_next, type = "action",
          opts = { nowait = true, silent = true }
        },
        ["<C-k>"] = {
          actions.move_selection_previous, type = "action",
          opts = { nowait = true, silent = true }
        },
        ["<esc>"] = actions.close,
      }
    }
  }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')


vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<c-f>g', function()
  return builtin.live_grep({ grep_open_file = true })
end, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<c-f>w', builtin.grep_string, {})
vim.keymap.set('n', '\\', builtin.buffers, {})
