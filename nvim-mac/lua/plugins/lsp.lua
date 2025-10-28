local lsp_config = require('../config/lsp')
lsp_config.setup()

return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {},
    config = true,
  },

  {
    'ray-x/lsp_signature.nvim',
    opts = {
      hint_prefix = ">> ",
    }
  },

  -- none-ls.nvim
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local null_ls = require('null-ls')
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup({
        sources = {
          -- formatting
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.markdownlint,

          -- diagnostics
          null_ls.builtins.diagnostics.staticcheck,
          -- null_ls.builtins.diagnostics.golangci_lint, -- commented because of performance problem
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.diagnostics.buf,
          null_ls.builtins.diagnostics.codespell,

          -- code_action
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.code_actions.impl,

          -- completion
          null_ls.builtins.completion.nvim_snippets,

          -- hover
          null_ls.builtins.hover.dictionary,
          null_ls.builtins.hover.printenv,
        },
        diagnostic_on_save = {
        },
        on_attach = function(client, bufnr)
          -- local opts = { noremap = true }
          -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
          -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
          -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
          --
          -- vim.keymap.set('n', '<space>s', function ()
          --   require('telescope.builtin').lsp_document_symbols({
          --     symbol_width = 100
          --   })
          -- end, {})
          -- vim.keymap.set('n', '<space>t', require('telescope.builtin').treesitter, {})
          --
          --
          -- vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {})
          -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
          -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
          -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
          -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
          -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
          -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
          -- vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, {})
          --
          -- vim.lsp.inlay_hint.enable(true)

        end
      })
    end
  },

  -- scala support plugin
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
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

}
