local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd,
  formatting.stylua,
  formatting.isort,
  diagnostics.flake8,
}

null_ls.setup {
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      -- Format file on save
      vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting()'
    end
  end,
}
