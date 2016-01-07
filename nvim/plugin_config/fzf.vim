nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Search for tasks across the current project
nnoremap <leader>t :Ag \(FIXME\)\\|\(TODO\)<cr>
nnoremap <C-p> :Files<cr>
