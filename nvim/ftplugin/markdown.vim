" Enable spellchecking for Markdown
" Also, indent 4 spaces
autocmd FileType markdown setlocal spell shiftwidth=4 tabstop=4

autocmd BufRead,BufNewFile *.md set filetype=markdown

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
