call plug#begin('~/.vim/plugged')

" Editor Extensions
Plug 'altercation/vim-colors-solarized'   " So pretty!
Plug 'ctrlpvim/ctrlp.vim'                 " Gotta go fast!
Plug 'bling/vim-airline'                  " Handy info
Plug 'scrooloose/syntastic'               " Linting in Vim
Plug 'scrooloose/nerdtree',               { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'           " Easy comments, baby!
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'                 " Run tasks asychronously from Vim
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/matchit.zip'            " More powerful % matching
Plug 'edkolev/tmuxline.vim'               " Make the Tmux bar match Vim
Plug 'ervandew/supertab'                  " Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --gocode-completer --clang-completer' }
Plug 'SirVer/ultisnips'                   " Snippets
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim'                       " Search
Plug 'Lokaltog/vim-easymotion'            " Move like the wind!
Plug 'vim-scripts/ctags.vim'              " ctags related stuff
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'      " .editorconfig support
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-webdevicons'
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plug 'reedes/vim-pencil'                  " Markdown, Writing

" Language-Specific Plugins
Plug 'pangloss/vim-javascript',           { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim',              { 'for': 'javascript' }
Plug 'mxw/vim-jsx',                       { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script',          { 'for': 'coffeescript' }
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-endwise',                 { 'for': 'ruby' }
Plug 'mattn/emmet-vim',                   { 'for': 'html' }
Plug 'othree/html5.vim',                  { 'for': 'html' }
Plug 'wting/rust.vim',                    { 'for': 'rust' }
Plug 'cespare/vim-toml',                  { 'for': 'rust' }
Plug 'mustache/vim-mustache-handlebars',  { 'for': 'html.handlebars' }
Plug 'groenewege/vim-less',               { 'for': 'less' }
Plug 'fatih/vim-go',                      { 'for': 'go' }
Plug 'nelstrom/vim-markdown-folding',     { 'for': 'markdown' }
Plug 'bpdp/vim-java',                     { 'for': 'java' }
Plug 'adragomir/javacomplete',            { 'for': 'java' }

call plug#end()
