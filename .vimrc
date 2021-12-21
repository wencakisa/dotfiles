" Use VIM settings rather than Vi settings
set nocompatible

" Show command in the bottom-right corner of the screen
set showcmd

" Command-line autocompletion
set wildmenu

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

" Leader is <Space>
let mapleader=' '

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

" Ctrl+/ comments out a line
nnoremap <C-_> <esc>:Commentary<cr>
inoremap <C-_> <esc>:Commentary<cr>A
vnoremap <C-_> :Commentary<cr>

" gd to Go to definition (in the same tab)
nmap <silent> gd <Plug>(coc-definition)
" gD to Go to definition (in a new tab)
nmap <silent> gD :call CocAction('jumpDefinition', 'tab drop')<cr>

" Ctrl+p to search files with FZF
nnoremap <silent> <C-p> :Files<cr>

" <leader>f searches the word under the cursor
noremap <silent> <leader>f :Ag <C-R><C-W><CR>

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

" Join lines without redundant <space>
nnoremap J gJ

" Scroll COC suggestion list with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" NERDTree bindings
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Angular mappings
map ,t :e <C-R>=expand("%:r") . ".html" <CR><CR>
map ,c :e <C-R>=expand("%:r") . ".ts" <CR><CR>
map ,s :e <C-R>=expand("%:r") . ".scss" <CR><CR>

" .vimrc binding
map <leader>ev :tabnew ~/.vimrc<CR>

" CamelCaseMotion
let g:camelcasemotion_key='<leader>'

" Use the silver searcher for fuzzy-finding
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" COC extensions
let g:coc_global_extensions=['coc-python', 'coc-tsserver']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions+=['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions+=['coc-eslint']
endif

" Update GitGutter on save
autocmd BufWritePost * GitGutter

" -------
" Airline
" -------

" Airline theme
let g:airline_theme='deus'

" Enable Git branch info via fugitive
let g:airline#extensions#branch#enabled=1
" Disable hunks info
let g:airline#extensions#hunks#enabled=0

" Use powerline fonts
let g:airline_powerline_fonts=1

" Tablines
let g:airline#extensions#tabline#enabled=1                        " Enable airline tabline
let g:airline#extensions#tabline#tabs_label=''                    " Do not display prefix before the tabs
let g:airline#extensions#tabline#show_buffers=0                   " Do not show buffers in the tabline
let g:airline#extensions#tabline#show_splits=0                    " Do not show splits in the tabline
let g:airline#extensions#tabline#tab_min_count=2                  " Minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_tab_nr=0                    " Disable tab numbers
let g:airline#extensions#tabline#show_close_button=0              " Remove 'X' at the end of the tabline
let g:airline#extensions#tabline#formatter='unique_tail_improved' " Display filenames as f/f/filename.ext
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'      " Hide the filetype section

function! AirlineInit()
  let g:airline_section_x=airline#section#create(['filetype'])
  let g:airline_section_y=''
  let g:airline_section_z=airline#section#create(['%l/%L'])
  let g:airline_section_error=''
  let g:airline_section_warning=''

  " Remove separators for empty sections
  let g:airline_skip_empty_sections=1

  let g:airline_symbols.branch=''
endfunction
autocmd VimEnter * call AirlineInit()

" Python highlighting
let g:python_highlight_all=1

" Gruvbox theme settings
set bg=dark
let g:gruvbox_contrast_dark="light"

set noshowmode

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

  " Color themes
  Plug 'morhetz/gruvbox'

  " Intellisense
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Fuzzy-finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " JavaScript / TypeScript / JSX
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'leafgarland/typescript-vim'

  " Python
  Plug 'vim-python/python-syntax'

  " Emmet
  Plug 'mattn/emmet-vim'

  " File icons based on type
  Plug 'ryanoasis/vim-devicons'

  " NERDTree
  Plug 'preservim/nerdtree'

  " Highlight focused buffer
  Plug 'TaDaa/vimade'
call plug#end()

colorscheme gruvbox
