" Run checker when a file is openned, saved
autocmd! BufRead,BufWritePost * Neomake

function! s:BreakOffLastPath(string)
  let array = split(a:string, '/')
  if len(array) == 1
    return '/'
  endif
  return '/' . join(array[0:len(array) - 2], '/')
endfunction

function! s:SearchForFile(name)
  let path = getcwd()
  while path != '/' && !filereadable(path . '/' . a:name)
    let path = s:BreakOffLastPath(path)
  endwhile
  return len(path) > 1
endfunction

" Dynamically set javascript makers
let js_makers = []
if s:SearchForFile('.jshintrc')
  call add(js_makers, 'jshint')
endif
if s:SearchForFile('.jscsrc')
  call add(js_makers, 'jscs')
endif
if s:SearchForFile('.eslintrc') || s:SearchForFile('.eslintrc.js') || s:SearchForFile('.eslintrc.json')
  call add(js_makers, 'eslint_d')
endif
let g:neomake_javascript_enabled_makers = js_makers
let g:neomake_jsx_enabled_makers = js_makers

" Other makers
let g:neomake_java_enabled_makers = ['javac']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_scss_enabled_checkers = ['scsslint']

" Custom makers
let g:neomake_python_flake8_maker = {
  \ 'exe': $PYENV_ROOT . '/versions/3.5.0/bin/flake8',
  \ 'errorformat':
      \ '%E%f:%l: could not compile,%-Z%p^,' .
      \ '%A%f:%l:%c: %t%n %m,' .
      \ '%A%f:%l: %t%n %m,' .
      \ '%-G%.%#'
  \ }
