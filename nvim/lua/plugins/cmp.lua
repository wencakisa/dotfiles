vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require 'cmp'
local select_opts = {
  behavior = cmp.SelectBehavior.Insert,
  select = true,
}

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, { name = 'buffer' }),
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
}

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

local lspconfig = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local disable_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = false
end

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client)
    disable_formatting(client)
  end,
}
lspconfig.jedi_language_server.setup { capabilities = capabilities }
lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = function(client)
    disable_formatting(client)
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}
