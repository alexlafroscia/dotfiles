" Section: General Config {{{1
" ----------------------------
let mapleader = " "

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
set hidden
set inccommand=nosplit

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
" Point to the Python executables in `asdf` {{{2
let g:python_host_prog = $ASDF_DATA_DIR . '/installs/python/2.7.18/bin/python'
let g:python3_host_prog = $ASDF_DATA_DIR . '/installs/python/3.8.5/bin/python'
" }}}2
" Point to the Node executables in `volta` {{{2
let g:node_host_prog = $VOLTA_HOME . '/tools/image/packages/neovim/4.9.0/bin/cli.js'
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

  au BufRead,BufNewFile *.scss set filetype=scss.css

  autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig

  " When term starts, auto go into insert mode
  autocmd TermOpen * startinsert

  " Turn off line numbers etc
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber
endif
" }}}1
" Section: Functions {{{

" Creates a floating window with a most recent buffer to be used
function! CreateCenteredFloatingWindow()
  let width = float2nr(&columns * 0.8)
  let height = float2nr(&lines * 0.8)
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]
  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

function! OnTermExit(job_id, code, event) dict
  if a:code == 0
    bd!
  endif
endfunction

" Open a terminal command in a floating window
function! OpenTerm(cmd)
  call CreateCenteredFloatingWindow()
  call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
endfunction
" }}}
" Section: External Functions {{{

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
  call system('gittower `git rev-parse --show-toplevel`')
endfunction
nnoremap <leader>gt :call OpenInGitTower()<CR>
" }}}
" }}}
" Section: Load vim-plug plugins {{{

" Specify plugins {{{2
call plug#begin(stdpath('data') . '/plugged')

" UI {{{3
Plug 'haishanh/night-owl.vim'
Plug 'vim-airline/vim-airline'            " Handy info
Plug 'vim-airline/vim-airline-themes'
Plug 'retorillo/airline-tablemode.vim'
Plug 'ryanoasis/vim-webdevicons'
Plug 'junegunn/goyo.vim'
Plug 'nvim-treesitter/nvim-treesitter'

" Project Navigation {{{3
Plug 'junegunn/fzf',                      { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'rbgrouleff/bclose.vim'              " Required by ranger.vim
Plug 'francoiscabrol/ranger.vim'

" File Navigation {{{3
Plug 'vim-scripts/matchit.zip'            " More powerful % matching
Plug 'Lokaltog/vim-easymotion'            " Move like the wind!
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " Smarter line numbers
Plug 'kshenoy/vim-signature'              " Show marks in the gutter
Plug 'haya14busa/incsearch.vim'           " Better search highlighting

" Editing {{{3
Plug 'tpope/vim-surround'                 " Change word surroundings
Plug 'tpope/vim-commentary'               " Comments stuff
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'dhruvasagar/vim-table-mode',        { 'on': 'TableModeEnable' }
Plug 'kana/vim-textobj-user'
Plug 'jasonlong/vim-textobj-css'
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-fugitive'                 " Git stuff in Vim
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim',                   { 'on': 'GV' }
Plug 'jez/vim-github-hub'                 " Filetype for hub pull requests

" Task Running
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'

" Autocomplete {{{3
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'iamcco/coc-tailwindcss', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-rls', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }

" Language Support {{{3
" JavaScript {{{4
Plug 'yuezk/vim-js'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'rhysd/npm-debug-log.vim'

" TypeScript {{{4
Plug 'peitalin/vim-jsx-typescript'

" Elm {{{4
Plug 'ElmCast/elm-vim'

" Handlebars
Plug 'joukevandermaas/vim-ember-hbs'

" HTML {{{4
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" CSS {{{4
Plug 'hail2u/vim-css3-syntax',            { 'for': 'css' }

" Sass {{{4
Plug 'cakebaker/scss-syntax.vim'

" Ruby {{{4
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-rails'

" Python {{{4
Plug 'klen/python-mode',                  { 'for': 'python' }

" Rust {{{4
Plug 'wellbredgrapefruit/tomdoc.vim',     { 'for': 'ruby' }
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'

" Markdown {{{4
Plug 'reedes/vim-pencil'                  " Markdown, Writing
Plug 'godlygeek/tabular',                 { 'for': 'markdown' } " Needed for vim-markdown
Plug 'plasticboy/vim-markdown',           { 'for': 'markdown' }
Plug 'jxnblk/vim-mdx-js'

" Elixir {{{4
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

call plug#end()
" Load plugin configurations {{{2
" For some reason, a few plugins seem to have config options that cannot be
" placed in the `plugins` directory. Those settings can be found here instead.

" vim-airline {{{3
let g:airline_powerline_fonts = 1 " Enable the patched Powerline fonts

" emmet-vim {{{3
let g:user_emmet_leader_key='<C-E>'

let g:user_emmet_settings = {
  \    'html' : {
  \        'quote_char': "'"
  \    }
  \}
" }}}3

" ranger.vim {{{3
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

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
nnoremap å <C-a>

nnoremap <A-x> <C-x>
nnoremap ≈ <C-x>

" Tab Shortcuts
nnoremap tk :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tj :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :CtrlSpaceTabLabel<CR>
nnoremap td :tabclose<CR>

nnoremap <silent> <c-j> :TmuxNavigateDown<cr>

" }}}2
" Insert Mode Remaps {{{2

set completeopt-=preview

" }}}2
" }}}1
" Section: Theme {{{

syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if has("termguicolors")  " set true colors
    set termguicolors
  endif
set background=dark
colorscheme night-owl

" }}}
" Section: Local-Machine Config {{{

if filereadable($DOTFILES . "/nvim/init.local.vim")
  source $DOTFILES/nvim/init.local.vim
endif
" }}}
