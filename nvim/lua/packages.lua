require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use {
    'luisiacc/gruvbox-baby',
    config = function ()
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
    config = function ()
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
    config = function ()
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
    config = function ()
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
    config = function ()
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
    config = function ()
      vim.g.camelcasemotion_key = '<leader>'
    end
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    'williamboman/nvim-lsp-installer',
    config = function ()
      require('nvim-lsp-installer').on_server_ready(function (server)
        local opts = {}

        if server.name == 'sumneko_lua' then
          opts = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim', 'use' }
                }
              }
            }
          }
        end

        server:setup(opts)
      end)
    end
  }

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function ()
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
    config = function ()
      require('trim').setup({
        patterns = {
          [[%s/\s\+$//e]],           -- remove unwanted spaces
          [[%s/\($\n\s*\)\+\%$//]],  -- trim last line
          [[%s/\%^\n\+//]]          -- trim first line
        }
      })
    end
  }
end)
