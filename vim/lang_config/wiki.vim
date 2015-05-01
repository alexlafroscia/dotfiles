" Edit vimwiki pages in pencil mode
autocmd BufRead,BufNewFile *.wiki call pencil#init({'wrap': 'soft'})
