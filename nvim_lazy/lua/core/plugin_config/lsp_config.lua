require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    --'gopls',
    'graphql',
    'eslint',
    'ts_ls',
    'rust_analyzer',
    'pyright',
    'svelte',
  }
})

--[[
-- nvim-cmp (autocomplete plugin)
--]]

local cmp = require('cmp')
--local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'ultisnips' },
    {
      name = 'buffer',
      option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end }
    },
    { name = 'codeium' },
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  -- lsp signature config
  require('lsp_signature').on_attach({
    hint_prefix = ">> ",
  }, bufnr)

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
  -- autoformatting on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_clear_autocmds({ group = lsp_autogroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { '*.rs', '*.c', '*.cpp', '*.py' },
      group = lsp_autogroup,
      callback = function()
        vim.lsp.buf.format()
      end
    })
  end
end

require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig').gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  }
}

require('lspconfig').graphql.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig').eslint.setup {
  capabilities = capabilities,
  flags = { debounce_text_changes = 500 },
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.documentFormattingProvider = true
    if client.server_capabilities.documentFormattingProvider then
      local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        command = [[:EslintFixAll]],
        --[[
        -- this not working in some cases
        callback: function()
          -- set async false because it write before format it
          vim.lsp.buf.format({ async = false })
        end,
        --]] --
        group = au_lsp,
      })
    end
    on_attach(client, bufnr)
  end,
}

require('lspconfig').ts_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "javascript",
    "typescript",
    "tsx",
    "jsx",
  }
}

require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig').pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig').svelte.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require('lspconfig').jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- require('lspconfig').coffeesense.setup{
--   capabilities = capabilities,
--   on_attach = on_attach,
-- }

require('lspconfig').intelephense.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

--[[
-- Null ls configs
--]]

local null_ls = require("null-ls")
local null_helpers = require("null-ls.helpers")

-- setup the coffeelint with null_ls
local coffeelint = {
  name = 'coffeelint',
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { 'coffee', },
  -- null_ls.generator creates an async source
  -- that spawns the command with the given arguments and options
  generator = null_ls.generator({
    command = "coffeelint",
    args = { "--stdin", "--reporter", "raw" },
    to_stdin = true,
    from_stderr = true,
    -- output format, can be (raw, json, line)
    format = 'json',
    on_output = function(params)
      params.output = params.output.stdin
      return null_helpers.diagnostics.from_json({
        attributes = {
          row = "lineNumber",
          code = "rule",
          severity = "level",
          message = "message",
        }
      })(params)
    end
  })
}

local cspell = require('cspell')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.diagnostics.php,
    -- null_ls.builtins.diagnostics.phpstan,
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.codespell,
    null_ls.builtins.diagnostics.staticcheck,
    -- null_ls.builtins.diagnostics.codespell.with({
      -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    -- }),
    coffeelint,
    cspell.diagnostics.with({
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.HINT
      end
    }),
    cspell.code_actions,
  },
  on_attach = on_attach,
  diagnostic_on_save = {
  }
})
