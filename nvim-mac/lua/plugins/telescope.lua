local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

return {
  -- Telescope Plugins
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        "kelly-lin/telescope-ag",
        dependencies = { "nvim-telescope/telescope.nvim" },
        -- cmd = { "Ag" },
        opts = { cmd = { "ag", "-s" } },
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      }
    },
    opts = {
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
              actions.select_default(prompt_bufnr) builtin.resume()
            end,
            ["<C-q>"] = actions.send_to_qflist,
            -- ["<esc>"] = actions.close,
          }
        }
      }
    },
    init = function()
      require('telescope').load_extension('ag')
      require('telescope').load_extension('fzf')

      vim.keymap.set('n', '<leader>t', builtin.find_files, {})
      vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {})
      vim.keymap.set('n', '<c-f>g', function()
        return builtin.live_grep({ grep_open_file = true })
      end, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<c-f>w', builtin.grep_string, {})
      vim.keymap.set('n', '\\', builtin.buffers, {})
    end

  },

}

