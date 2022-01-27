let $LANG='en_US'

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.config/nvim/plugged')

  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " Multi language highlighting
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-buftabline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'iamcco/coc-angular'
  "Colors
  Plug 'cocopon/iceberg.vim'
  "Comments
  Plug 'tpope/vim-commentary'

  " git wrapper
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  
  "Fuzzy find
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  "Dev icons
  Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme iceberg 

let g:ale_disable_lsp = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']

" Fix files automatically on save
let g:ale_fix_on_save = 1

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

" }}}


set nocompatible
filetype on
filetype plugin on
filetype indent on
" syntax on
set number
set cursorline
set cursorcolumn
" Fix typescript issue
set re=0
"Spell check
"Spell check test should highlight this 
set spell

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000
" Enable auto completion menu after pressing TAB.
set wildmenu

"Highlight matching bracket
set showmatch

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

set encoding=UTF-8

let mapleader = "\<Space>"

nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
" splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

nnoremap <C-t> :NERDTreeToggle<cr>
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 1

"FZF
set rtp+=/opt/homebrew/opt/fzf

"fzf bindings
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" commentary
" not working please investigate
nnoremap <C-=> gcc

inoremap jj <esc>

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
