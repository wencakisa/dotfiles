local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd,
  formatting.stylua,
  formatting.isort,
  formatting.black.with { extra_args = { '--fast' } },
  diagnostics.flake8,
}

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      -- Format file on save
      vim.api.nvim_create_autocmd('BufWritepre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
