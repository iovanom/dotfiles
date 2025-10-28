-- lua/config/lsp/init.lua

-- Create a table to act as our module
local M = {}

-- This is the function that will be called from our plugin spec
function M.setup()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local on_attach = function(client, bufnr)
    -- This is where you can set buffer-local keymaps and options
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>s', function ()
      require('telescope.builtin').lsp_document_symbols({
        symbol_width = 100
      })
    end, {})
    vim.keymap.set('n', '<space>t', require('telescope.builtin').treesitter, {})
    vim.keymap.set('n', '<space>g', require('telescope.builtin').git_status, {})
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, {})
    --vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    
    vim.lsp.inlay_hint.enable(true)
  end

  vim.lsp.config('*', {
    on_attach = on_attach,
    capabilities = capabilities,
  })

  vim.lsp.config('pylsp', {
    settings = {
      pylsp = {
        plugins = {
          jedi_completion = {
            fuzzy = true,
          },
          flake8 = {
            enabled = false,
          },
        },
        python = {
          pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
        },
      },
    },
  })

end

-- Return our module table
return M
