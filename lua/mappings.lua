function map(mode, shortcut, command, opts)
  local options = { noremap = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

function nmap(shortcut, command, opts)
  map('n', shortcut, command, opts)
end

function imap(shortcut, command, opts)
  map('i', shortcut, command)
end

function vmap(shortcut, command, opts)
  map('v', shortcut, command, opts)
end

-- Leader is <Space>
vim.g.mapleader = ' '

-- Comment out lines with Ctrl + /
nmap('<C-_>', '<esc>:Commentary<cr>')
imap('<C-_>', '<esc>:Commentary<cr>')
vmap('<C-_>', ':Commentary<cr>')

-- gd to Go to definition (in the same tab)
nmap('gd', '<Plug>(coc-definition)', { silent = true })
-- gD to Go to definition (in a new tab)
nmap('gD', ":call CocAction('jumpDefinition', 'tab drop')<cr>", { silent = true })

-- Ctrl+p to search files with FZF
nmap('<C-p>', ':Files<cr>')

-- <leader>f searches the word under the cursor
nmap('<leader>F', '<Plug>CtrlSFPrompt')
nmap('<leader>f', '<Plug>CtrlSFCwordExec')
vmap('<leader>f', '<Plug>CtrlSFVwordExec')

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

-- Scroll COC suggestion list with tab
imap('<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
imap('<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })

-- NERDTree bindings
nmap('<C-t>', ':NERDTreeToggle<cr>')
nmap('<C-f>', ':NERDTreeFind<cr>')

-- .vimrc binding
nmap('<leader>ev', ':tabnew ~/.vimrc<cr>')
