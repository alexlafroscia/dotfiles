" Shortcut to open TagBar
noremap <leader>tb :TagbarToggle<cr>

let g:tagbar_ctags_bin = "$HOME/.homebrew/bin/ctags"

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/opt/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
      \ 's:sections',
      \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
      \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" Add support for Elixir in Tagbar
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
    \ }
