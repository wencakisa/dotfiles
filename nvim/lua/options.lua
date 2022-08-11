-- Show command in the bottom-right corner of the screen
vim.opt.showcmd = true

-- Command-line autocompletion
vim.opt.wildmenu = true

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.wrap = false

-- Start scrolling when you reach five lines before the end of the screen.
-- Helps with the neck pain :P
vim.opt.scrolloff = 5

-- Do not wrap lines on a new line
vim.opt.tw = 0

-- Highlight current line
vim.opt.cursorline = true

-- Better, faster, stronger
vim.opt.ttyfast = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Searching
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
