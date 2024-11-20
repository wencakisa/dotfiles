local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettierd,
  formatting.stylua,
  diagnostics.eslint,
}

local event = 'BufWritePost'
local async = event == 'BufWritePost'

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      -- Format file on save
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = async }
        end,
      })
    end
  end,
}
