set nocompatible

" Show command in the bottom-right corner of the screen
set showcmd

" Command-line autocompletion
set wildmenu
set wildmode=longest:list,full

" Leader is <Space>
let mapleader=' '

" Use system clipboard
set clipboard=unnamedplus

" Indentation
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2
set smartindent
set nowrap

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Watch for file changes
set autoread

" Start scrolling when you reach five lines before the end of the screen.
" Helps with the neck pain :P
set scrolloff=5

" Allow usage of mouse for all modes.
set mouse=a

" Prevent VIM from wrapping lines on a new line
set tw=0

" Trim trailing whitespace
autocmd BufWritePre <buffer> :%s/\s\+$//e

" ------------
" Line numbers
" ------------

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
set ignorecase
set incsearch

" Python specific settings
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4

" Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " SI = INSERT mode
let &t_SR = "\<Esc>]50;CursorShape=2\x7" " SR = REPLACE mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " EI = NORMAL mode

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

" Map <C-a> to select the entire content of the file
nnoremap <C-a> ggVG

" <leader>d deletes the whole line
nnoremap <leader>d dd

" Ctrl+/ comments out a line
nnoremap <C-_> <esc>:Commentary<esc>
inoremap <C-_> <esc>:Commentary<esc>A

" gd to Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Ctrl+p to search files with FZF
nnoremap <silent> <C-p> :Files<CR>

" NERDTree mappings
nnoremap <leader>n :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" -------
" Plugins
" -------

call plug#begin()
  " Comment stuff out
  Plug 'tpope/vim-commentary'

  " Surround
  Plug 'tpope/vim-surround'

  " CamelCase / snake_case motion
  Plug 'bkad/CamelCaseMotion'

  " Dracula theme
  Plug 'dracula/vim', { 'as': 'dracula' }

  " Intellisense
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Fuzzy-finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " NERDTree
  Plug 'preservim/nerdtree'

  " TODO: airline
call plug#end()

" Dracula theme settings
let g:dracula_italic=0
colorscheme dracula

" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Ignore unnecessary files & folders in NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules', 'media', 'staticfiles']

" Use the silver searcher for fuzzy-finding
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore media --ignore staticfiles -g ""'

