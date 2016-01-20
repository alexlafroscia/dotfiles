let g:python_host_prog = $PYENV_ROOT . '/versions/2.7.10/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/3.5.0/bin/python'

" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_checkers = []

" Use Ctrl-] to look up the definition of some variable/method, just like in
" other parts of Vim
let g:pymode_rope_goto_definition_bind = "<C-]>"
