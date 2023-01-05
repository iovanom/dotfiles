vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = '<c-e>', action = 'close', mode = 'n' },
        { key = 'e', action = 'open', mode = 'n' },
        { key = 'E', action = 'noop', mode = 'n' },
      }
    }
  }
})

vim.keymap.set('n', '<c-e>', ':NvimTreeFindFileToggle<cr>')
