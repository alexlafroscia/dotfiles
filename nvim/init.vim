" Section: General Config {{{1
" ----------------------------
let mapleader = " "
let &runtimepath .= "," . $DOTFILES . "/nvim"  " Add DOTFILES to runtimepath

set shell=zsh " Set bash as the prompt for Vim
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set scrolloff=3
set list listchars=tab:»·,trail:·  " Display extra whitespace characters

" Line numbers
set number
set numberwidth=5

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Highlight search matches
set hlsearch

" Make it obvious where 120 characters is {{{2
" Lifted from StackOverflow user Jeremy W. Sherman
" http://stackoverflow.com/a/3765575/2250435
if exists('+colorcolumn')
  set textwidth=120
  set colorcolumn=+1
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
endif " }}}2
" Open new split panes to right and bottom, which feels more natural {{{2
set splitbelow
set splitright
" }}}2
" Point to the Python executables in `pyenv` {{{2
let g:python_host_prog = $PYENV_ROOT . '/versions/2.7.10/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/3.5.0/bin/python'
" }}}2
" Configure grep to use The Silver Searcher {{{2
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif
" }}}2
" }}}1
" Section: Autocommands {{{1
" --------------------------
if has("autocmd")
  filetype plugin indent on

  autocmd BufReadPost * " {{{2
    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif "}}}2

  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
                                        \ | set textwidth=0

  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig

  " Load inline HTMLBars Highlighting
  autocmd BufRead,BufNewFile *.js HighlightInlineHbs
endif
" }}}1
" Section: External Functions {{{

" Open folder in finder {{{
function! OpenInFinder()
  call system('open ' . getcwd())
endfunction
nnoremap <leader>f :call OpenInFinder()<CR>
" }}}
" Open current file in Marked {{{
function! MarkedPreview()
  :w
  exec ':silent !open -a "Marked 2.app" ' . shellescape('%:p')
  redraw!
endfunction
nnoremap <leader>md :call MarkedPreview()<CR>
" }}}
" Open current repo in Tower {{{
function! OpenInGitTower()
  call system('gittower ' . getcwd())
endfunction
nnoremap <leader>gt :call OpenInGitTower()<CR>
" }}}
" Open current directory in Atom {{{
function! OpenInAtom()
  :w
  exec ':silent !atom ' . shellescape('%:p')
  redraw!
endfunction
nnoremap <leader>a :call OpenInAtom()<CR>
" }}}
" }}}
" Section: Load vim-plug plugins {{{

" Specify plugins {{{2
call plug#begin()

" UI
Plug 'trevordmiller/nova-vim'
Plug 'vim-airline/vim-airline'            " Handy info
Plug 'retorillo/airline-tablemode.vim'
Plug 'edkolev/tmuxline.vim'               " Make the Tmux bar match Vim
Plug 'ryanoasis/vim-webdevicons'
Plug 'junegunn/goyo.vim'

" Project Navigation
Plug 'junegunn/fzf',                      { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
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
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" Editing
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary'               " Comments stuff
Plug 'dhruvasagar/vim-table-mode',        { 'on': 'TableModeEnable' }
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'jasonlong/vim-textobj-css'
Plug 'Konfekt/FastFold'

" Git
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim',                   { 'on': 'GV' }
Plug 'jez/vim-github-hub'

" Task Running
Plug 'tpope/vim-dispatch'                 " Run tasks asychronously in Tmux
Plug 'benekastah/neomake'                 " Run tasks asychronously in NeoVim
Plug 'wincent/terminus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Olical/vim-enmasse'                 " Edit all files in a Quickfix list

" Autocomplete
Plug 'Shougo/deoplete.nvim',              { 'do': function('hooks#remote') }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'

" Misc.
Plug 'editorconfig/editorconfig-vim'
Plug 'rizzatti/dash.vim'

" Language-Specific Plugins
Plug 'pangloss/vim-javascript',           { 'branch': 'develop' }
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'ternjs/tern_for_vim',               { 'do': 'npm install' }
Plug 'rhysd/npm-debug-log.vim'
Plug '~/projects/vim-plugins/vim-ember-cli'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'dustinfarris/vim-htmlbars-inline-syntax'
Plug 'reedes/vim-pencil'                  " Markdown, Writing
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-endwise'
Plug 'wellbredgrapefruit/tomdoc.vim',     { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'mattn/emmet-vim'
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'
Plug 'mustache/vim-mustache-handlebars'
Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'
Plug '~/Code/vim/postcss-syntax.vim'
Plug 'fatih/vim-go',                      { 'for': 'go' }
Plug 'godlygeek/tabular',                 { 'for': 'markdown' } " Needed for vim-markdown
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }
Plug 'bpdp/vim-java',                     { 'for': 'java' }
Plug 'adragomir/javacomplete',            { 'for': 'java' }
Plug 'klen/python-mode',                  { 'for': 'python' }
Plug 'davidhalter/jedi-vim',              { 'for': 'python' }
Plug 'alfredodeza/pytest.vim',            { 'for': 'python' }

Plug 'neovim/node-host',                  { 'do': 'npm install' }

call plug#end()
" }}}2
" Load plugin configurations {{{2
" For some reason, a few plugins seem to have config options that cannot be
" placed in the `plugins` directory. Those settings can be found here instead.

" vim-airline {{{3
let g:airline_powerline_fonts = 1 " Enable the patched Powerline fonts
" }}}3

" emmet-vim {{{3
let g:user_emmet_leader_key='<C-E>'

let g:user_emmet_settings = {
  \    'html' : {
  \        'quote_char': "'"
  \    }
  \}
" }}}3
" }}}2
" }}}1
" Section: Remaps {{{1

" Normal Mode Remaps {{{2

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Smarter pasting
nnoremap <Leader>p :set invpaste paste?<CR>

" -- Smart indent when entering insert mode with i on empty lines --------------
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" Remap the increment and decrement features of Vim
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Tab Shortcuts
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap td :tabclose<CR>

nnoremap <silent> <c-j> :TmuxNavigateDown<cr>

" }}}2
" Insert Mode Remaps {{{2

set completeopt-=preview
function! InsertTabWrapper()
  let col = col('.') - 1
  if pumvisible()
    return "\<C-n>"
  elseif !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return deoplete#mappings#manual_complete()
  endif
endfunction
inoremap <silent> <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? '<C-p>' : ''

" }}}2
" }}}1
" Section: Theme {{{

syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set background=dark
colorscheme nova

" Setup Terminal Colors For Neovim {{{
if has('nvim')
  " dark0 + gray
  let g:terminal_color_0 = "#282828"
  let g:terminal_color_8 = "#928374"

  " neurtral_red + bright_red
  let g:terminal_color_1 = "#cc241d"
  let g:terminal_color_9 = "#fb4934"

  " neutral_green + bright_green
  let g:terminal_color_2 = "#98971a"
  let g:terminal_color_10 = "#b8bb26"

  " neutral_yellow + bright_yellow
  let g:terminal_color_3 = "#d79921"
  let g:terminal_color_11 = "#fabd2f"

  " neutral_blue + bright_blue
  let g:terminal_color_4 = "#458588"
  let g:terminal_color_12 = "#83a598"

  " neutral_purple + bright_purple
  let g:terminal_color_5 = "#b16286"
  let g:terminal_color_13 = "#d3869b"

  " neutral_aqua + faded_aqua
  let g:terminal_color_6 = "#689d6a"
  let g:terminal_color_14 = "#8ec07c"

  " light4 + light1
  let g:terminal_color_7 = "#a89984"
  let g:terminal_color_15 = "#ebdbb2"
endif " }}}
" }}}
" Section: Local-Machine Config {{{

if filereadable($DOTFILES . "/nvim/init.local.vim")
  source $DOTFILES/nvim/init.local.vim
endif
" }}}
