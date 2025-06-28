return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    init = function()
    end
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
      null_ls.setup({
        sources = {
          -- formatting
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.markdownlint,

          -- diagnostics
          null_ls.builtins.diagnostics.staticcheck,
          null_ls.builtins.diagnostics.golangci_lint,
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
        on_attach = function()
          local opts = { noremap = true }
          vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

          vim.keymap.set('n', '<space>s', function ()
            require('telescope.builtin').lsp_document_symbols({
              symbol_width = 100
            })
          end, {})
          vim.keymap.set('n', '<space>t', require('telescope.builtin').treesitter, {})


          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
          vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        end
      })
    end
  }
}
