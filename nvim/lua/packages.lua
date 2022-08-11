require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use {
    'luisiacc/gruvbox-baby',
    config = function()
      vim.opt.background = 'dark'
      vim.g.gruvbox_baby_background_color = 'dark'
      vim.g.gruvbox_baby_function_style = 'NONE'
      vim.g.gruvbox_baby_keyword_style = 'NONE'

      vim.cmd([[colorscheme gruvbox-baby]])
    end
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = { theme = 'gruvbox-baby' },
        sections = {
          lualine_x = { 'filetype' },
          lualine_y = {},
          lualine_z = { '%l/%L' }
        },
      })
    end
  }

  -- Tabline
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          mode = 'tabs',
          show_close_icon = false,
          show_buffer_close_icons = false
        }
      })
    end
  }

  -- Gitsigns (gutter)
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Git blame
  use {
    'f-person/git-blame.nvim',
    config = function()
      -- Disable blame by default, toggle when needed
      vim.g.gitblame_enabled = 0
    end
  }

  -- Commentary
  use 'tpope/vim-commentary'

  -- Treesitter
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'javascript',
          'typescript',
          'tsx',
          'json',
          'python',
          'lua',
          'vim',
          'html',
          'css'
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true
        },
        context_commentstring = {
          enable = true
        }
      })
    end
  }

  -- CamelCaseMotion
  use {
    'bkad/CamelCaseMotion',
    config = function()
      vim.g.camelcasemotion_key = '<leader>'
    end
  }

  -- LSP
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('nvim-lsp-installer').setup({})
    end
  }
  use 'neovim/nvim-lspconfig'

  -- Completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

      local cmp = require('cmp')
      local select_opts = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }
        }, { name = 'buffer' }),
        mapping = {
          ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
          ['<Down>'] = cmp.mapping.select_next_item(select_opts),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
              cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
            else
              cmp.complete()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(select_opts)
            else
              fallback()
            end
          end, { 'i', 's' })
        }
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

      lspconfig.tsserver.setup({ capabilities = capabilities })
      lspconfig.jedi_language_server.setup({ capabilities = capabilities })
      lspconfig.sumneko_lua.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })
    end
  }

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('nvim-tree').setup()
    end
  }

  -- Surround
  use({
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end
  })

  -- FZF
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Trim whitespaces
  use {
    'cappyzawa/trim.nvim',
    config = function()
      require('trim').setup({
        patterns = {
          [[%s/\s\+$//e]], -- remove unwanted spaces
          [[%s/\($\n\s*\)\+\%$//]], -- trim last line
          [[%s/\%^\n\+//]] -- trim first line
        }
      })
    end
  }
end)
