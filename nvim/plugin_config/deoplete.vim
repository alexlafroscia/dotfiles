" Use deoplete
let g:deoplete#enable_at_startup = 1

" Set whitelist of sources for some filetypes
let g:deoplete#sources = {}
let g:deoplete#sources.python = ['jedi', 'ultisnips']
