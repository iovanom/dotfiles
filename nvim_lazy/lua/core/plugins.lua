-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- Install lazy.nvim if it's not already installed
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",  -- latest stable release
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins.lua

local plugins = {
  -- Colorschemes
  'ellisonleao/gruvbox.nvim',
  {
    'ray-x/starry.nvim',
    init = function()
      vim.g.starry_italic_comments = true
    end,
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Nvim Tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- Other Plugins
  'kchmck/vim-coffee-script',
  'tpope/vim-surround',
  'nvim-lualine/lualine.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'vim-test/vim-test',

  -- LSP and Completion Plugins
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'mfussenegger/nvim-dap',
  'nvimtools/none-ls.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp',
  'SirVer/ultisnips',
  -- 'quangnguyen30192/cmp-nvim-ultisnips',
  'ray-x/lsp_signature.nvim',

  -- Telescope Plugins
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function()
        end
      },
      {
        "kelly-lin/telescope-ag",
        dependencies = { "nvim-telescope/telescope.nvim" },
        cmd = { "Ag" },
        config = function()
          local telescope_ag = require("telescope-ag")
          telescope_ag.setup({ cmd = { "ag", "-s" } })
        end
      },
    },
    config = function()
      local actions = require('telescope.actions')
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

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ag')

      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>t', builtin.find_files, {})
      vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {})
      vim.keymap.set('n', '<c-f>g', function()
        return builtin.live_grep({ grep_open_file = true })
      end, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<c-f>w', builtin.grep_string, {})
      vim.keymap.set('n', '\\', builtin.buffers, {})

      -- vim.api.nvim_create_user_command('Ag', function(opts)
      --   builtin.live_grep({ default_text = opts.args })
      -- end, { nargs = '*' })

    end,
  },

  -- Go Development
  {
    'fatih/vim-go',
    build = ':GoUpdateBinaries',
  },

  -- Miscellaneous Plugins
  'skywind3000/asyncrun.vim',
  'jparise/vim-graphql',
  'dhruvasagar/vim-table-mode',
  'editorconfig/editorconfig-vim',
  -- 'github/copilot.vim',
  {
  'Exafunction/codeium.vim',
     event = 'BufEnter'
  },
  'prisma/vim-prisma',
  'davidmh/cspell.nvim',
  -- 'rest-nvim/rest.nvim',
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require("mini.ai").setup({})
    end
  },

  -- Avante and Dependencies
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "claude",
      auto_suggestions_provider = "claude",
      openai = {
        model = 'gpt-4o-mini',
      },
      claude = {
        model = "claude-3-5-sonnet-20241022",
        -- model = "claude-3-7-sonnet-20250219",
        -- disable_tools = true,
      },
      vendors = {
        openrouter = {
          __inherited_from = 'openai',
          endpoint = 'https://openrouter.ai/api/v1',
          api_key_name = 'OPENROUTER_API_KEY',
          -- model = 'deepseek/deepseek-r1',
          -- model='anthropic/claude-3.5-haiku',
          model='google/gemini-2.0-flash-001',
          disable_tools = true,
        },
      },
      mappings = {
        sidebar = {
          switch_windows = 'none',
          reverse_switch_windows = 'none',
        }
      },
      windows = {
        width = 40
      }
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      -- "nvim-tree/nvim-web-devicons", -- or
      "echasnovski/mini.icons",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

-- Initialize lazy.nvim with your plugins
require("lazy").setup({
  spec = plugins,
  checker = { enabled = true },
})
