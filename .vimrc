syntax on
set nocompatible
filetype off

let mapleader=' '

" Use system clipboard
set clipboard=unnamed

" Indentation
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set nowrap

" Trim trailing whitespace
autocmd BufWritePre <buffer> :%s/\s\+$//e

" Line numbers
set number relativenumber

" Absolute line numbers in INSERT mode
" Relative line numbers otherwise
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Searching
set smartcase
set incsearch

" Python specific settings
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4

" ----------
" Remappings
" ----------

" Shift-tab
inoremap <S-Tab> <C-d>

" No arrow keys in normal mode :P
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

" Leader mappings
nnoremap <leader>d dd

" -------
" Plugins
" -------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " Comment stuff out
  Plugin 'tpope/vim-commentary'

  " Surround
  Plugin 'tpope/vim-surround'

  " CamelCase / snake_case motion
  Plugin 'bkad/CamelCaseMotion'

  " Dracula theme
  Plugin 'dracula/vim', { 'name': 'dracula' }

  " TODO: coc / fzf / nerdtree / airline
call vundle#end()

filetype plugin indent on
colorscheme dracula
