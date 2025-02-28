vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-e>', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'e', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'E', function() end, opts('No operation'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  view = {
    adaptive_size = true,
  },
  on_attach = my_on_attach,
  ---
}

local mappings = {
  list = {
    { key = '<c-e>', action = 'close', mode = 'n' },
    { key = 'e', action = 'open', mode = 'n' },
    { key = 'E', action = 'noop', mode = 'n' },
  }
}

vim.keymap.set('n', '<c-e>', ':NvimTreeFindFileToggle<cr>')
