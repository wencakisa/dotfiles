require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'json',
    'python',
    'lua',
    'vim',
    'html',
    'css',
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}

require('ts_context_commentstring').setup {}
vim.g.skip_ts_context_commentstring_module = true
