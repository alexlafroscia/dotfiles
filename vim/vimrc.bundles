if &compatible
  set nocompatible
end

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                  " Let Vundle manage Vundle

" Editor Extensions
Plugin 'altercation/vim-colors-solarized'   " So pretty!
Plugin 'ctrlpvim/ctrlp.vim'                 " Gotta go fast!
Plugin 'bling/vim-airline'                  " Handy info
Plugin 'scrooloose/syntastic'               " Linting in Vim
Plugin 'scrooloose/nerdtree'                " Navigate the filesystem, in Vim
Plugin 'scrooloose/nerdcommenter'           " Easy comments, baby!
Plugin 'tpope/vim-surround'                 " Change word surroundings
Plugin 'tpope/vim-fugitive'                 " Git stuff in Vim
Plugin 'tpope/vim-projectionist'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/matchit.zip'            " More powerful % matching
Plugin 'edkolev/tmuxline.vim'               " Make the Tmux bar match Vim
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'                       " Search
Plugin 'Lokaltog/vim-easymotion'            " Move like the wind!
Plugin 'vim-scripts/ctags.vim'              " ctags related stuff
Plugin 'majutsushi/tagbar'
Plugin 'editorconfig/editorconfig-vim'      " .editorconfig support
Plugin 'vimwiki/vimwiki'
Plugin 'ryanoasis/vim-webdevicons'

" Language-Specific Plugins
Plugin 'pangloss/vim-javascript'            " JavaScript
Plugin 'marijnh/tern_for_vim'
Plugin 'mxw/vim-jsx'                        " JSX
Plugin 'kchmck/vim-coffee-script'           " CoffeeScript
Plugin 'vim-ruby/vim-ruby'                  " Ruby...
Plugin 'tpope/vim-endwise'
Plugin 'mattn/emmet-vim'                    " HTML
Plugin 'wting/rust.vim'                     " Rust
Plugin 'cespare/vim-toml'
Plugin 'mustache/vim-mustache-handlebars'   " Handlebars
Plugin 'reedes/vim-pencil'                  " Markdown, Writing
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'groenewege/vim-less'                " Less
Plugin 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plugin 'fatih/vim-go'                       " Better Go support

" Java
Plugin 'bpdp/vim-java'
Plugin 'adragomir/javacomplete'
Plugin 'vim-scripts/groovy.vim'
Plugin 'tfnico/vim-gradle'                  " Groovy and Gradle

" Run commands in Tmux from Vim
Plugin 'jgdavey/tslime.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-dispatch'                 " Run tasks asychronously from Vim

Plugin 'osyo-manga/vim-over'

" Install any machine-only plugins
if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call vundle#end()
filetype on
