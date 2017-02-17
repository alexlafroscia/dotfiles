setlocal spell
setlocal shiftwidth=4
setlocal tabstop=4

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Add mapping for table formatting
nnoremap <LocalLeader>f :TableFormat<CR>
