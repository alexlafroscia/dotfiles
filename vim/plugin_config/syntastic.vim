" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Silence certain HTML warnings
let g:syntastic_html_tidy_ignore_errors = [
  \  'plain text isn''t allowed in <head> elements',
  \  '<base> escaping malformed URI reference',
  \  'discarding unexpected <body>',
  \  '<script> escaping malformed URI reference',
  \  '</head> isn''t allowed in <body> elements',
  \  'missing <li>',
  \  '<input> isn''t allowed in <body> elements',
  \  'trimming empty <span>',
  \  'trimming empty <i>',
  \  'proprietary attribute \"ng-'
  \ ]

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_java_checkers = ['javac']

let g:syntastic_coffee_coffeelint_ignore_errors = [
  \  'Backticks are forbidden'
  \ ]

let g:syntastic_html_handlebars_checkers = ['handlebars']
