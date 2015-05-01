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
