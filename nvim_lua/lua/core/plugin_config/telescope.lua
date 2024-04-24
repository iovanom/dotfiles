local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup({
  defaults = {
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "ignore_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
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
        ["<C-o>"] = function(prompt_bufnr)
          require("telescope.actions").select_default(prompt_bufnr) require("telescope.builtin").resume()
        end,
        ["<C-q>"] = actions.send_to_qflist,
        -- ["<esc>"] = actions.close,
      }
    }
  }
})

local telescope_ag = require("telescope-ag")
telescope_ag.setup({
    cmd = { "ag", "-s" } -- defaults to telescope_ag.cmds.ag
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('ag')


vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<c-f>g', function()
  return builtin.live_grep({ grep_open_file = true })
end, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<c-f>w', builtin.grep_string, {})
vim.keymap.set('n', '\\', builtin.buffers, {})
