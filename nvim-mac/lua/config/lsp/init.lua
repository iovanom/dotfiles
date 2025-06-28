-- lua/config/lsp/init.lua

-- Create a table to act as our module
local M = {}

-- This is the function that will be called from our plugin spec
function M.setup()
  -- Get the lspconfig plugin
  local lspconfig = require("lspconfig")

  -- (Optional) If you use nvim-cmp, you'll need its capabilities.
  -- Otherwise, you can remove this or use the commented-out version.
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- The on_attach function is the heart of your LSP customisation.
  -- It runs once, for each language server, after it attaches to a buffer.
  local on_attach = function(client, bufnr)
    -- This is where you can set buffer-local keymaps and options
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    -- Keymaps from my previous recommendation
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
  end

  -- Check if mason-lspconfig is available
  local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not mason_lspconfig_ok then
    vim.notify("mason-lspconfig is not available", vim.log.levels.ERROR)
    return
  end

  -- This is the magic that ties mason-lspconfig to lspconfig
  -- It will look at the servers you have installed with Mason and automatically
  -- set them up using the configuration below.
  mason_lspconfig.setup_handlers({
    -- The default handler function
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,

    -- You can add custom setups for specific servers here. For example:
    -- ["lua_ls"] = function()
    --   lspconfig.lua_ls.setup({
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --     settings = {
    --       Lua = {
    --         diagnostics = {
    --           globals = { "vim" } -- Tell the LSP that `vim` is a global
    --         }
    --       }
    --     }
    --   })
    -- end,
  })
end

-- Return our module table
return M
