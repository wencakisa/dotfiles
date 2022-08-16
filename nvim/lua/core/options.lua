local o = vim.opt

-- Command-line autocompletion
o.wildmenu = true

-- Use system clipboard
o.clipboard = 'unnamedplus'

-- Indentation
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.wrap = false

-- Start scrolling when you reach five lines before the end of the screen.
-- Helps with the neck pain :P
o.scrolloff = 5

-- Do not wrap lines on a new line
o.tw = 0

-- Highlight current line
o.cursorline = true

-- Line numbers
o.number = true
o.relativenumber = true

-- Searching
o.smartcase = true
o.ignorecase = true
o.incsearch = true

o.termguicolors = true
