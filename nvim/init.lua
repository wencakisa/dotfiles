-- Strongly influenced from https://github.com/brainfucksec/neovim-lua

require 'packer_init'

require 'core/mappings'
require 'core/options'
require 'core/colors'
require 'core/commands'

require 'plugins/nvim-lsp-installer'
require 'plugins/null-ls'
require 'plugins/lualine'
require 'plugins/bufferline'
require 'plugins/treesitter'
require 'plugins/cmp'
require 'plugins/camel-case-motion'
require 'plugins/git-blame'
require 'plugins/nvim-tree'
require 'plugins/telescope'
-- require 'plugins/neovide'
