" Auto-Install vim-plug
let nvim_config_dir = '~/.config/nvim'
if empty(glob(nvim_config_dir . '/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Editor Extensions
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf',                      { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'                  " Handy info
Plug 'scrooloose/nerdtree',               { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary'               " Comments stuff
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'jaxbot/github-issues.vim'
Plug 'tpope/vim-dispatch'                 " Run tasks asychronously in Tmux
Plug 'benekastah/neomake'                 " Run tasks asychronously in NeoVim
Plug 'tpope/vim-projectionist'
Plug 'Shougo/deoplete.nvim',              { 'do': function('hooks#remote') }
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/matchit.zip'            " More powerful % matching
Plug 'edkolev/tmuxline.vim'               " Make the Tmux bar match Vim
Plug 'wincent/terminus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'                  " Autocomplete
Plug 'haya14busa/incsearch.vim'           " Better search highlighting
Plug 'romainl/vim-qlist'
Plug 'Lokaltog/vim-easymotion'            " Move like the wind!
Plug 'wellle/targets.vim'
Plug 'vim-scripts/ctags.vim'              " ctags related stuff
Plug 'majutsushi/tagbar'
" Plug 'editorconfig/editorconfig-vim'      " .editorconfig support
Plug 'ryanoasis/vim-webdevicons'
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plug 'reedes/vim-pencil'                  " Markdown, Writing
Plug 'beloglazov/vim-online-thesaurus'
Plug 'davidoc/taskpaper.vim'
Plug 'rizzatti/dash.vim'
Plug 'junegunn/goyo.vim'
Plug 'kshenoy/vim-signature'

" Language-Specific Plugins
Plug 'pangloss/vim-javascript',           { 'for': 'javascript' }
Plug 'mxw/vim-jsx',                       { 'for': 'javascript' }
Plug '~/projects/vim-plugins/vim-ember-cli'
Plug '~/projects/vim-plugins/vim-babel-repl'
Plug 'kchmck/vim-coffee-script',          { 'for': 'coffee' }
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-endwise',                 { 'for': 'ruby' }
Plug 'wellbredgrapefruit/tomdoc.vim',     { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim',                  { 'for': 'html' }
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
Plug 'klen/python-mode',                  { 'for': 'python' }
Plug 'alfredodeza/pytest.vim',            { 'for': 'python' }

call plug#end()
