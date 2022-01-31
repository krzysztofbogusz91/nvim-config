" ---------------------------------
" Krzysztof Bogusz Neovim Settings
" ---------------------------------

" -----------------
" General Settings
" -----------------

let $LANG='en_US'
let g:python3_host_prog = '/usr/bin/python'

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set cursorline
set cursorcolumn
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
" Fix typescript issue
set re=0
"Spell check
"Spell check test should highlight this 
set spelllang=en
set spell
" Set shift width to 4 spaces.
set shiftwidth=2
" Set tab width to 4 columns.
set tabstop=2
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
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" -----------------
" Key maps
" -----------------

map <Space> <Leader>
inoremap jj <esc>

nmap <leader>Q :bufdo bdelete<cr>
" Allow gf to open non-existent files from path
map gf :edit <cfile><cr>

nnoremap <C-t>p :tabprevious<CR>                                                                            
nnoremap <C-t>n :tabnext<CR>
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

" -----------------
" Plugins
" -----------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

  source ~/.config/nvim/plugins/vim-airline.vim
  source ~/.config/nvim/plugins/nerdtree.vim
  source ~/.config/nvim/plugins/vim-sayonara.vim
  source ~/.config/nvim/plugins/coc.vim
  source ~/.config/nvim/plugins/vim-polyglot.vim
  source ~/.config/nvim/plugins/iceberg.vim
  source ~/.config/nvim/plugins/vim-commentary.vim
  source ~/.config/nvim/plugins/vim-fugitive.vim
  source ~/.config/nvim/plugins/fzf.vim
 
call plug#end()

colorscheme iceberg 
