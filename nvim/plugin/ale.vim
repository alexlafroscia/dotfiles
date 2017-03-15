" Only run ESLint for JS files
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'

" Use C-k and C-j to navigate errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
