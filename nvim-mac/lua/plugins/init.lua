
return {

  -- lua plugins utils
  'nvim-lua/plenary.nvim',

  'folke/which-key.nvim',

  -- Colorschemes
  {
    'ellisonleao/gruvbox.nvim',
    priority = 100,
    opts = {
      terminal_colors = true,
      bold = false,
      palette_overrides = {
        --bright_green = "#4ab300",
      }
    },
    config = true,
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
  --'skywind3000/asyncrun.vim',

  -- Markdown
  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      -- file_types = { "markdown", "Avante", "mdc" },
      file_types = { "Avante" },
    },
    ft = { "markdown", "Avante" },
  },

  -- Debug adapter protocol
  {
    'mfussenegger/nvim-dap',
    config = function(self, opts)
      -- Debug settings if you're using nvim-dap
      local dap = require("dap")

      -- mapping
      vim.keymap.set("n", "<leader>dc", function()
        require("dap").continue()
      end)

      vim.keymap.set("n", "<leader>dr", function()
        require("dap").repl.toggle({ height = 16 })
      end)

      vim.keymap.set("n", "<leader>dK", function()
        require("dap.ui.widgets").hover()
      end)

      vim.keymap.set("n", "<leader>dt", function()
        require("dap").toggle_breakpoint()
      end)

      vim.keymap.set("n", "<leader>dso", function()
        require("dap").step_over()
      end)

      vim.keymap.set("n", "<leader>dsi", function()
        require("dap").step_into()
      end)

      vim.keymap.set("n", "<leader>dl", function()
        require("dap").run_last()
      end)

      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
    end
  },

  -- Dap view
  {
      "igorlfs/nvim-dap-view",
      ---@module 'dap-view'
      ---@type dapview.Config
      opts = {},
  },

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
    opts = {
      win = {
        type = "split",
        position="right",
        size = { width = 75 }
      }
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>cx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>cX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>ck",
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

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
  },

  -- notifications
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },

  -- AI tab completion
  {
    "Exafunction/windsurf.nvim",
    -- event = 'BufEnter',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    main = "codeium",
    opts = {
      virtual_text = {
        enabled = true,
      },
    }
  },
}
