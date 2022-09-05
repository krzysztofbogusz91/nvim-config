  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  nnoremap <leader>gs :Git<CR>
  nnoremap <leader>gc :Git commit -v -q<CR>
  nnoremap <leader>ga :Gcommit --amend<CR>
  nnoremap <leader>gt :Gcommit -v -q %<CR>
  nnoremap <leader>gd :Gvdiffsplit<CR>
  nnoremap <leader>ge :Gedit<CR>
  nnoremap <leader>gr :Gread<CR>
  nnoremap <leader>gw :Gwrite<CR><CR>
  nnoremap <leader>gl :silent! Glog<CR>
  nnoremap <leader>gp :Ggrep<Space>
  nnoremap <leader>gm :Gmove<Space>
  nnoremap <leader>gb :Git branch<Space>
  nnoremap <leader>go :Git checkout<Space>
  nnoremap <leader>gps :Dispatch! git push<CR>
  nnoremap <leader>gpl :Dispatch! git pull<CR>
