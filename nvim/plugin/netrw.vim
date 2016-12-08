let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,'.netrw_gitignore#Hide()

noremap <Leader>n :Vexplore<cr>
