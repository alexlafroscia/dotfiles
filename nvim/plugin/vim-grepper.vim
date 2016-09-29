let g:grepper = {
  \ 'tools': ['rg', 'git', 'ag'],
  \ }

command! -nargs=* -complete=file Rg Grepper -noprompt -tool rg -query <args>
