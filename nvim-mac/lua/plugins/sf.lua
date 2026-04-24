return {
  'xixiaofinland/sf.nvim',

  enabled = false,
  dependencies = {
    'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
    'stevearc/overseer.nvim',
  },

  opts = {
    terminal = 'overseer',
  }
}
