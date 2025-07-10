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

return {
    -- Nvim Tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      view = {
        adaptive_size = true,
      },
      renderer = {
        group_empty = true,
      },
      on_attach = my_on_attach,
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.keymap.set('n', '<c-e>', ':NvimTreeFindFileToggle<cr>')
    end
  },
}
