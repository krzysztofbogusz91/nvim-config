Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'
" Handle multi-file find and replace.
Plug 'mhinz/vim-grepper'
 
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

"FZF
set rtp+=/opt/homebrew/opt/fzf

" Commands

command! -bang -nargs=* ProjectRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --glob "!yarn.lock*" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview({ 'dir': s:find_git_root() }),
  \   <bang>0)

"fzf bindings
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

let g:grepper={}
let g:grepper.tools=["rg"]

" Search in files
nnoremap <Leader>/ :ProjectRg!<CR>
nmap <leader>F :Rg<space>
nmap <leader>f :Rg<cr>

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

