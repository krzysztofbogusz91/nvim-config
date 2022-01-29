
Plug 'dense-analysis/ale'

let g:ale_disable_lsp = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']

" Fix files automatically on save
let g:ale_fix_on_save = 1

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
