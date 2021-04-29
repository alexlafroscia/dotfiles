" Reference:
" https://github.com/skbolton/titan/blob/da9cae1d70b2bc7fbcb50a585971f3e297be2ede/nvim/nvim/status-line.vim
let g:lightline = {
  \ 'colorscheme': 'night_owl',
  \ 'separator': {
  \   'left': "\uE0B8 ",
  \   'right': " \uE0BA"
  \ },
  \ 'active': {
  \   'left': [
  \     ['mode'],
  \     ['readonly', 'filename', 'modified'],
  \     []
  \   ],
  \   'right': [
  \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
  \     ['lsp_ready'],
  \     ['lineinfo']
  \   ]
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_infos': 'lightline#ale#infos',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_function': {
  \   'treesitter': 'GetTreesitterStatus',
  \   'lsp_ready': 'LSPServerReady'
  \ },
  \ 'component_type': {
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \ }
  \ }

function! LSPServerReady()
  let lsp_clients_length = luaeval('#vim.lsp.buf_get_clients()')

  if lsp_clients_length == 0
    return 'No LSP'
  endif

  let ready = luaeval('vim.lsp.buf.server_ready()')
  return ready ? '' : 'Preparing LSP'
endfunction

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129a "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"
