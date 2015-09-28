" Auto-Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Editor Extensions
Plug 'altercation/vim-colors-solarized'   " So pretty!
Plug 'NLKNguyen/papercolor-theme'         " Great, light theme
Plug 'ctrlpvim/ctrlp.vim'                 " Gotta go fast!
Plug 'bling/vim-airline'                  " Handy info
Plug 'scrooloose/syntastic'               " Linting in Vim
Plug 'scrooloose/nerdtree',               { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary'               " Comments stuff
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'tpope/vim-dispatch'                 " Run tasks asychronously from Vim
Plug 'tpope/vim-projectionist'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/matchit.zip'            " More powerful % matching
Plug 'edkolev/tmuxline.vim'               " Make the Tmux bar match Vim
Plug 'wincent/terminus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'                  " Autocomplete
Plug 'rking/ag.vim'                       " Search
Plug 'haya14busa/incsearch.vim'           " Better search highlighting
Plug 'romainl/vim-qlist'
Plug 'Lokaltog/vim-easymotion'            " Move like the wind!
Plug 'vim-scripts/ctags.vim'              " ctags related stuff
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'      " .editorconfig support
Plug 'ryanoasis/vim-webdevicons'
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plug 'reedes/vim-pencil'                  " Markdown, Writing
Plug 'beloglazov/vim-online-thesaurus'
Plug 'davidoc/taskpaper.vim'

" Language-Specific Plugins
Plug 'pangloss/vim-javascript',           { 'for': 'javascript' }
" Plug 'marijnh/tern_for_vim',              { 'for': 'javascript', 'do': 'npm install' }
Plug 'mxw/vim-jsx',                       { 'for': 'javascript' }
Plug '~/projects/vim-plugins/vim-ember-cli'
Plug 'kchmck/vim-coffee-script',          { 'for': 'coffeescript' }
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-endwise',                 { 'for': 'ruby' }
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim',                  { 'for': 'html' }
Plug 'wting/rust.vim',                    { 'for': 'rust' }
Plug 'cespare/vim-toml',                  { 'for': 'rust' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'groenewege/vim-less',               { 'for': 'less' }
Plug 'cakebaker/scss-syntax.vim',         { 'for': 'scss' }
Plug 'fatih/vim-go',                      { 'for': 'go' }
Plug 'nelstrom/vim-markdown-folding',     { 'for': 'markdown' }
Plug 'bpdp/vim-java',                     { 'for': 'java' }
Plug 'adragomir/javacomplete',            { 'for': 'java' }
Plug 'klen/python-mode',                  { 'for': 'python' }

call plug#end()
