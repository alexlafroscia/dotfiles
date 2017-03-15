" Only run ESLint for JS files
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'

" Use ALT-k and ALT-j to navigate errors
nmap <silent> ˚ <Plug>(ale_previous_wrap)
nmap <silent> ∆ <Plug>(ale_next_wrap)
