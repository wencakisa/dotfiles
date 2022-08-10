lua require('mappings')
lua require('options')

" Absolute line numbers in INSERT mode
" Relative line numbers otherwise
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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

function! PrintVar()
  let selection = expand("<cword>")

  if (&filetype == "javascript") || (&filetype == "javascriptreact") || (&filetype == "typescript") || (&filetype == "typescriptreact")
    call append(line("."), "console.log('" . selection . ": ', " . selection . ")")
  elseif &filetype == "python"
    call append(line("."), "print('" . selection . ": ', " . selection . ")")
  endif
endfunction

nnoremap <leader>p :call PrintVar()<CR>

" CamelCaseMotion
let g:camelcasemotion_key='<leader>'

let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" CtrlSF settings
let g:ctrlsf_auto_focus={
  \ "at": "start"
  \ }

" COC extensions
let g:coc_global_extensions=['coc-python', 'coc-tsserver']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions+=['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions+=['coc-eslint']
endif

" Automatically sort Python imports on save
autocmd BufWrite *.py :CocCommand python.sortImports

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

" Highlight and strip whitespace on save
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_confirm=0

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

  " CtrlSF
  Plug 'dyng/ctrlsf.vim'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " JavaScript / TypeScript / JSX
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  " Python
  Plug 'vim-python/python-syntax'

  " Emmet
  Plug 'mattn/emmet-vim'

  " NERDTree
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  Plug 'leafOfTree/vim-matchtag'

  " Trim trailing whitespace
  Plug 'ntpeters/vim-better-whitespace'
call plug#end()

colorscheme gruvbox
