
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
      file_types = { "markdown", "Avante", "mdc" },
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

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
  },

  -- scala support plugin
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "mfussenegger/nvim-dap",
        config = function(self, opts)
          -- Debug settings if you're using nvim-dap
          local dap = require("dap")

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
    },
    event = "BufReadPre",
    opts = function()
      local metals_config = require("metals").bare_config()

      metals_config.init_options.statusBarProvider = "off"

      -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
        -- your on_attach function
        vim.keymap.set("n", "<leader>ws", function()
          require("metals").hover_worksheet()
        end)
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          -- This line is key!
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
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
