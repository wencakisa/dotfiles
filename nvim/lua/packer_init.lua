require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'lukas-reineke/lsp-format.nvim'

  -- Colorschemes
  use 'sainnhe/everforest'
  use 'EdenEast/nightfox.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- File tree & Lualine (requires devicons)
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'

  -- Tabline
  use { 'akinsho/bufferline.nvim' }

  -- Gitsigns (gutter)
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- Git blame
  use 'f-person/git-blame.nvim'

  -- Tim Pope plugins
  use 'tpope/vim-commentary'
  use 'tpope/vim-abolish'

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

  -- Copilot
  use 'github/copilot.vim'
end)
