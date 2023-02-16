require('nvim-tree').setup {
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 's', action = 'vsplit' },
        { key = 't', action = 'tabnew' },
        { key = '<C-t>', action = '' },
      },
    },
  },
}
