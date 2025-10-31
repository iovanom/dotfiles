-- lua/config/lsp/init.lua

-- Create a table to act as our module
local M = {}

function M.on_attach(client, bufnr)
  -- This is where you can set buffer-local keymaps and options
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts)
  vim.keymap.set('n', '<space>s', function ()
    require('telescope.builtin').lsp_document_symbols({
      symbol_width = 100
    })
  end, bufopts)
  vim.keymap.set('n', '<space>t', require('telescope.builtin').treesitter, bufopts)
  vim.keymap.set('n', '<space>g', require('telescope.builtin').git_status, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, bufopts)
  --vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

  vim.lsp.inlay_hint.enable(true)
end

-- This is the function that will be called from our plugin spec
function M.setup()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  vim.lsp.config('*', {
    on_attach = M.on_attach,
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

  vim.lsp.config('lua_ls', {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using
          -- (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {
            'vim',
            'require'
          },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })

end

-- Return our module table
return M
