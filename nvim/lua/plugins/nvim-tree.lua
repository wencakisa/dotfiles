require('nvim-tree').setup {
  open_on_setup = true,
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
