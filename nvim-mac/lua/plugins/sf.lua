return {
  'xixiaofinland/sf.nvim',

  enabled = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
    'stevearc/overseer.nvim',
  },

  opts = {
    terminal = 'overseer',
  }
}
