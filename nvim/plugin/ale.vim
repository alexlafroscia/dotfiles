" Advance through errors
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" Do not use ALE for auto-complete
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1

" Configure linters/fixers
let g:ale_fixers = {
\  'css': ['prettier'],
\  'handlebars': ['prettier'],
\  'html': ['prettier'],
\  'javascript': ['prettier', 'eslint'],
\  'json': ['prettier'],
\  'jsonc': ['prettier'],
\  'markdown': ['prettier'],
\  'rust': ['rustfmt'],
\  'sass': ['prettier'],
\  'typescript': ['prettier', 'eslint'],
\  'typescriptreact': ['prettier', 'eslint'],
\  'yaml': ['prettier'],
\ }

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Custom icons in gutter
let g:ale_sign_column_always = 1
let g:ale_sign_error = "!"
let g:ale_sign_warning = "?"
let g:ale_sign_info = "i"

" Show error info for line when cursor is on that line
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "🔥 "

" Use `eslint_d` to speed up linting
" let g:ale_javascript_eslint_executable = 'eslint_d'
" let g:ale_javascript_eslint_use_global = 1
