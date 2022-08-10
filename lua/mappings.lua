-- Leader is <Space>
vim.g.mapleader = ' '

-- Comment out lines with Ctrl + /
vim.api.nvim_set_keymap('n', '<C-_>', '<esc>:Commentary<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-_>', '<esc>:Commentary<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-_>', ':Commentary<cr>', { noremap = true })
