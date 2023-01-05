require('lualine').setup {
  options = {
    icons_enbled = true,
    theme = 'gruvbox',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
