" Auto-Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" UI
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'                  " Handy info
Plug 'edkolev/tmuxline.vim'               " Make the Tmux bar match Vim
Plug 'ryanoasis/vim-webdevicons'
Plug 'junegunn/goyo.vim'

" Project Navigation
Plug 'junegunn/fzf',                      { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree',               { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/ctags.vim'              " ctags related stuff
Plug 'majutsushi/tagbar'

" File Navigation
Plug 'vim-scripts/matchit.zip'            " More powerful % matching
Plug 'Lokaltog/vim-easymotion'            " Move like the wind!
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature'
Plug 'haya14busa/incsearch.vim'           " Better search highlighting

" Editing
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary'               " Comments stuff
Plug 'junegunn/vim-peekaboo'

" Git
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'airblade/vim-gitgutter'

" Task Running
Plug 'tpope/vim-dispatch'                 " Run tasks asychronously in Tmux
Plug 'benekastah/neomake'                 " Run tasks asychronously in NeoVim
Plug 'wincent/terminus'
Plug 'christoomey/vim-tmux-navigator'

" Autocomplete
Plug 'Shougo/deoplete.nvim',              { 'do': function('hooks#remote') }
Plug 'SirVer/ultisnips',                  { 'do': function('hooks#remote') }
Plug 'ervandew/supertab'                  " Autocomplete

" Misc.
Plug 'editorconfig/editorconfig-vim'      " .editorconfig support
Plug 'rizzatti/dash.vim'

" Language-Specific Plugins
Plug 'pangloss/vim-javascript',           { 'for': 'javascript' }
Plug 'mxw/vim-jsx',                       { 'for': 'javascript' }
Plug 'rhysd/npm-debug-log.vim'
Plug '~/projects/vim-plugins/vim-ember-cli'
Plug '~/projects/vim-plugins/vim-babel-repl'
Plug 'reedes/vim-pencil'                  " Markdown, Writing
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-endwise',                 { 'for': 'ruby' }
Plug 'wellbredgrapefruit/tomdoc.vim',     { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'mattn/emmet-vim'
" Plug 'othree/html5.vim',                  { 'for': 'html' }
Plug 'wting/rust.vim',                    { 'for': 'rust' }
Plug 'cespare/vim-toml',                  { 'for': 'rust' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'groenewege/vim-less',               { 'for': 'less' }
Plug 'cakebaker/scss-syntax.vim',         { 'for': 'scss' }
Plug 'fatih/vim-go',                      { 'for': 'go' }
Plug 'godlygeek/tabular',                 { 'for': 'markdown' } " Needed for vim-markdown
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }
Plug 'bpdp/vim-java',                     { 'for': 'java' }
Plug 'adragomir/javacomplete',            { 'for': 'java' }
" Plug 'klen/python-mode',                  { 'for': 'python' }
Plug 'alfredodeza/pytest.vim',            { 'for': 'python' }

Plug 'neovim/node-host',                  { 'do': 'npm install' }

call plug#end()
