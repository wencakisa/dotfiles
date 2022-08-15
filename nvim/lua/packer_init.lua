require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('nvim-lsp-installer').setup {}
    end,
  }

  use 'neovim/nvim-lspconfig'

  -- Colorscheme
  use 'sainnhe/everforest'

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- Tabline
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- Gitsigns (gutter)
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- Git blame
  use 'f-person/git-blame.nvim'

  -- Commentary
  use 'tpope/vim-commentary'

  -- Treesitter
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-treesitter/nvim-treesitter'

  -- CamelCaseMotion
  use 'bkad/CamelCaseMotion'

  -- Completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/nvim-cmp'

  -- File tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  -- Surround
  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
  }

  -- FZF
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Null LS (linting, formatting)
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Startup screen
  use 'goolord/alpha-nvim'
end)
