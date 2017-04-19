" https://github.com/carlitux/deoplete-ternjs#vim-configuration-example
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
