set nocompatible

" Show command in the bottom-right corner of the screen
set showcmd

" Command-line autocompletion
set wildmenu
set wildmode=longest:list,full

" Leader is <Space>
let mapleader=' '

" Use system clipboard
set clipboard+=unnamedplus

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

" Disable usage of mouse for all modes.
set mouse-=a

" Do not wrap lines on a new line
set tw=0

" Highlight current line
set cursorline

" Better, faster, stronger
set ttyfast

" Time in milliseconds to wait for a key code sequence to complete.
set ttimeoutlen=50

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
let &t_SI="\<Esc>]50;CursorShape=1\x7" " SI=INSERT mode
let &t_SR="\<Esc>]50;CursorShape=2\x7" " SR=REPLACE mode
let &t_EI="\<Esc>]50;CursorShape=0\x7" " EI=NORMAL mode

" ----------
" Remappings
" ----------

" Shift-tab
inoremap <S-Tab> <C-d>

" No arrow keys :P
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

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

" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>
inoremap <leader>1 <Esc>1gtA
inoremap <leader>2 <Esc>2gtA
inoremap <leader>3 <Esc>3gtA
inoremap <leader>4 <Esc>4gtA
inoremap <leader>5 <Esc>5gtA
inoremap <leader>6 <Esc>6gtA
inoremap <leader>7 <Esc>7gtA
inoremap <leader>8 <Esc>8gtA
inoremap <leader>9 <Esc>9gtA
inoremap <leader>0 <Esc>:tablast<CR>A

" Faster moving through windows
nnoremap <C-w> <C-w><C-w>

" Scroll COC suggestion list with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" CamelCaseMotion
let g:camelcasemotion_key='<leader>'

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Ignore unnecessary files & folders in NERDTree
let NERDTreeIgnore=['\.pyc$', '__pycache__', 'node_modules', 'media', 'staticfiles']

" Use the silver searcher for fuzzy-finding
let $FZF_DEFAULT_COMMAND='ag --ignore .git --ignore media --ignore staticfiles -g ""'

" COC extensions
let g:coc_global_extensions=['coc-python', 'coc-tsserver']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions+=['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions+=['coc-eslint']
endif

" Airline customizations
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#branch#enabled=1

" Python highlighting
let g:python_highlight_all=1

" Dracula theme settings
let g:dracula_italic=0

" -------
" Plugins
" -------

call plug#begin()
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

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

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " JavaScript / JSX
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'

  " Python
  Plug 'vim-python/python-syntax'
call plug#end()

colorscheme dracula
