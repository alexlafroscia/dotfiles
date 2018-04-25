call deoplete#enable()

call deoplete#custom#option('ignore_sources', {
  \ 'typescript': ['buffer']
  \ })

" Map `<tab>` to Deoplete
inoremap <silent><expr> <TAB>
  \ pumvisible()
  \ ? "\<C-n>"
  \ : <SID>check_back_space()
     \ ? "\<TAB>"
     \ : deoplete#mappings#manual_complete()
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? '<C-p>' : ''

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
