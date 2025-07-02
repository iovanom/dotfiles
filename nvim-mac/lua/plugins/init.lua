
return {

  -- lua plugins utils
  'nvim-lua/plenary.nvim',

  'folke/which-key.nvim',

  -- Colorschemes
  {
    'ellisonleao/gruvbox.nvim',
    init = function()
      vim.o.background = 'dark'

      -- highlight color columnt
      vim.cmd [[ set colorcolumn=80,120 ]]
      vim.cmd [[ highlight ColorColumn ctermbg=234 ]]
      vim.cmd [[ colorscheme gruvbox ]]
    end
  },

  -- {
  --   'ray-x/starry.nvim',
  --   main = 'starry',
  --   opts = {
  --     italic = {
  --       comments = true
  --     },
  --   }
  -- },

  -- end colorschemes plugins

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
      }
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  'tpope/vim-surround',

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = { icons_enbled = true, theme = 'gruvbox' },
      sections = { lualine_a = { { 'filename', path = 1 } } }
    }
  },

  {
    'vim-test/vim-test',
    init = function()
      vim.keymap.set('n', 'tn', ':TestNearest<cr>', { silent = true })
    end
  },

  -- Go Development
  {
    'fatih/vim-go',
    build = ':GoUpdateBinaries',
  },

  -- Miscellaneous Plugins
  'editorconfig/editorconfig-vim',
  'skywind3000/asyncrun.vim',

  -- Markdown
  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },

  -- Debug adapter protocol
  'mfussenegger/nvim-dap',

  -- mini.nvim
  {
    'echasnovski/mini.nvim',
    version = false,
    init = function()
      require("mini.ai").setup({})
    end
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- 'terrastruct/d2-vim',
}
