" Run checker when a file is openned, saved
autocmd! BufRead,BufWritePost * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_java_enabled_makers = ['javac']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = {
  \ 'exe': $PYENV_ROOT . '/versions/3.5.0/bin/flake8',
  \ 'errorformat':
      \ '%E%f:%l: could not compile,%-Z%p^,' .
      \ '%A%f:%l:%c: %t%n %m,' .
      \ '%A%f:%l: %t%n %m,' .
      \ '%-G%.%#'
  \ }
let g:neomake_scss_enabled_checkers = ['scsslint']
