-- Leader is <Space>
vim.g.mapleader = ' '

-- Comment out lines with Ctrl + /
vim.api.nvim_set_keymap('n', '<C-_>', '<esc>:Commentary<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-_>', '<esc>:Commentary<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-_>', ':Commentary<cr>', { noremap = true })

-- gd to Go to definition (in the same tab)
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
-- gD to Go to definition (in a new tab)
vim.api.nvim_set_keymap('n', 'gD', ":call CocAction('jumpDefinition', 'tab drop')<cr>", { silent = true })

-- Ctrl+p to search files with FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<cr>', { noremap = true })

-- <leader>f searches the word under the cursor
vim.api.nvim_set_keymap('n', '<leader>F', '<Plug>CtrlSFPrompt', {})
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>CtrlSFCwordExec', {})
vim.api.nvim_set_keymap('v', '<leader>f', '<Plug>CtrlSFVwordExec', {})

-- Go to tab by number
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', { noremap = true })

-- Join lines without redundant <space>
vim.api.nvim_set_keymap('', 'J', 'gJ', { noremap = true })

-- Scroll COC suggestion list with tab
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })

-- NERDTree bindings
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<cr>', { noremap = true })

-- .vimrc binding
vim.api.nvim_set_keymap('n', '<leader>ev', ':tabnew ~/.vimrc<cr>', { noremap = true })
