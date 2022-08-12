require('lualine').setup {
  options = { theme = 'everforest' },
  sections = {
    lualine_x = { 'filetype' },
    lualine_y = {},
    lualine_z = { '%l/%L' },
  },
}
