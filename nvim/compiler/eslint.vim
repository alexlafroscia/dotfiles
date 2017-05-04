"============================================================================
"File:        eslint.vim
"Description: Vim compiler integration for ESLint.
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

" Duplicates the last line for compatibility with Dispatch
" https://github.com/tpope/vim-dispatch/issues/199#issuecomment-299336621
CompilerSet errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m,
      \%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m,
      \%-G%.%#,
      \%-G%.%#
CompilerSet makeprg=yarn\ eslint\ -s\ --\ -f\ compact\ --fix\ %
