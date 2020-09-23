" Let CoC handle integration with language servers
let g:ale_disable_lsp = 1

" Configure linters/fixers
let g:ale_fixers = {
\  'css': ['prettier'],
\  'handlebars': ['prettier'],
\  'html': ['prettier'],
\  'javascript': ['prettier', 'eslint'],
\  'json': ['prettier'],
\  'markdown': ['prettier'],
\  'rust': ['rustfmt'],
\  'typescript': ['prettier', 'eslint'],
\  'yaml': ['prettier'],
\ }

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
