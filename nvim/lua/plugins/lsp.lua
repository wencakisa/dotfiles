local lsp_format = require 'lsp-format'
local lsp_config = require 'lspconfig'

require('mason').setup {}
require('mason-lspconfig').setup {}

lsp_format.setup {}

local on_attach = function(client, bufnr)
  lsp_format.on_attach(client, bufnr)
end

lsp_config.ruff.setup {
  on_attach = on_attach,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
      ignoreStandardLibrary = true,
      organizeImports = true,
      fixAll = true,
    },
  },
}
lsp_config.eslint.setup {
  on_attach = on_attach,
}
lsp_config.sourcery.setup {
  on_attach = on_attach,
}

local group = vim.api.nvim_create_augroup('RuffFormat', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = group,
  pattern = '*.py',
  callback = function()
    vim.cmd [[silent! !ruff check --fix %]]
    -- vim.cmd [[silent! noautocmd edit]] -- Reload the file without triggering autocommands
  end,
})
