local function map(mode, shortcut, command, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

local function nmap(shortcut, command, opts)
  map('n', shortcut, command, opts)
end

local function imap(shortcut, command, opts)
  map('i', shortcut, command, opts)
end

local function vmap(shortcut, command, opts)
  map('v', shortcut, command, opts)
end

-- Leader is <Space>
vim.g.mapleader = ' '

-- Comment out lines with Ctrl + /
nmap('<C-_>', '<esc>:Commentary<cr>')
imap('<C-_>', '<esc>:Commentary<cr>')
vmap('<C-_>', ':Commentary<cr>')

-- gd to Go to definition (in the same tab)
nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
nmap('gD', ':tab split<cr> <cmd>lua vim.lsp.buf.definition()<cr>')

-- Ctrl+p to search files with Telescope
nmap('<C-p>', ':Telescope find_files<cr>')
-- <leader>f searches word
nmap('<leader>F', ':Telescope live_grep<cr>')
nmap('<leader>f', ':Telescope grep_string<cr>')

-- Go to tab by number
nmap('<leader>1', '1gt')
nmap('<leader>2', '2gt')
nmap('<leader>3', '3gt')
nmap('<leader>4', '4gt')
nmap('<leader>5', '5gt')
nmap('<leader>6', '6gt')
nmap('<leader>7', '7gt')

-- Join lines without redundant <space>
map('', 'J', 'gJ')

-- NvimTree
nmap('<C-t>', ':NvimTreeToggle<cr>')
nmap('<C-f>', ':NvimTreeFindFile<cr>')

-- Ctrl+g toggles Git blame
nmap('<C-g>', ':GitBlameToggle<cr>')

-- Navigation shortcuts
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Custom commands defined in `/commands`
nmap('<leader>p', ':Print<cr>')
nmap('<leader>d', ':Debugger<cr>')
