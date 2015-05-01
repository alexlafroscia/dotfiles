"    VimWiki is an awesome plugin for creating shared wikis of information that
"    are accessible from any Vim session you might be in.  Below is my
"    configuration, which sets up one generate wiki and then a second, separate
"    one for work

let wiki_main = {}
let wiki_main.path = '~/Dropbox/Documents/wikis/main/'

let wiki_qualaris = {}
let wiki_qualaris.path = '~/Dropbox/Documents/wikis/qualaris/'
let wiki_qualaris.diary_rel_path = 'notebook/'
let wiki_qualaris.diary_index = 'notebook'
let wiki_qualaris.diary_header = 'Lab Notebook'

let g:vimwiki_list = [wiki_main, wiki_qualaris]
let g:vimwiki_folding = ''
