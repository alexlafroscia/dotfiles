" Inherit from the base `nova` theme
runtime colors/nova.vim

" Language: All {{{1

" Make comments italic {{{2
highlight Comment cterm=italic gui=italic

" Make more built-in langauge features italic {{{2
highlight Include ctermfg=81 guifg=#9A93E1 guibg=#3C4C55 cterm=italic gui=italic
highlight Keyword cterm=italic gui=italic
" highlight Statement cterm=italic gui=italic
highlight Type cterm=italic gui=italic

" Language: JavaScript {{{1

" `this` {{{2
highlight jsThis cterm=italic gui=italic

" Functions {{{2
highlight jsFunction cterm=italic gui=italic
highlight jsModuleAsterisk cterm=italic gui=italic

" Assignments {{{2
highlight jsStorageClass cterm=italic gui=italic

" Import/Export {{{2
highlight jsExportDefault cterm=italic gui=italic

" Object/Class Properties and Methods {{{2
highlight jsObjectKey cterm=italic gui=italic
highlight jsObjectFuncName cterm=italic gui=italic ctermfg=14 guifg=#83AFE5 guibg=#3C4C55
highlight jsClassFuncName cterm=italic gui=italic ctermfg=14 guifg=#83AFE5 guibg=#3C4C55
