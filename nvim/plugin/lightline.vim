" Reference:
" https://github.com/skbolton/titan/blob/da9cae1d70b2bc7fbcb50a585971f3e297be2ede/nvim/nvim/status-line.vim
let g:lightline = {
  \ 'colorscheme': 'night_owl',
  \ 'active': {
  \   'left': [
  \     ['mode'],
  \     ['readonly', 'filename', 'modified'],
  \     []
  \   ],
  \   'right': [
  \     ['linter_errors', 'linter_warnings', 'linter_infos', 'linter_hints', 'linter_ok'],
  \     [],
  \     ['lineinfo']
  \   ]
  \ },
  \ 'component_expand': {
  \   'linter_hints': 'lightline#lsp#hints',
  \   'linter_infos': 'lightline#lsp#infos',
  \   'linter_warnings': 'lightline#lsp#warnings',
  \   'linter_errors': 'lightline#lsp#errors',
  \   'linter_ok': 'lightline#lsp#ok',
  \ },
  \ 'component_type': {
  \   'linter_hints': 'right',
  \   'linter_infos': 'right',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'right',
  \ }
  \ }

let g:lightline#lsp#indicator_hints = "\uf002 "
let g:lightline#lsp#indicator_infos = "\uf129 "
let g:lightline#lsp#indicator_warnings = "\uf071 "
let g:lightline#lsp#indicator_errors = "\uf05e "
let g:lightline#lsp#indicator_ok = "\uf00c"
