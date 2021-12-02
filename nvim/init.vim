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
set timeoutlen=500
set ttimeoutlen=0
set updatetime=1000
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

" Open new split panes to right and bottom, which feels more natural {{{2
set splitbelow
set splitright
" }}}2
" Point to the Python executables in `asdf` {{{2
let g:python_host_prog = $ASDF_DATA_DIR . '/installs/python/2.7.18/bin/python'
let g:python3_host_prog = $ASDF_DATA_DIR . '/installs/python/3.8.5/bin/python'
" }}}2
" Point to the Ruby executable in `asdf` {{{2
" Ruby host program look-up supports evaluating a string to look up the path dynamically
" This is not the case for other hosts
let g:ruby_host_prog = "asdf which neovim-ruby-host"
" }}}2
" Point to the Node executables in `volta` {{{2
" Uses the `system` function to allow Volta to provide the path dynamically
" Newline must be trimmed off to avoid issue with Volta adding it to command output
let g:node_host_prog = trim(system('volta which neovim-node-host'))
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

  autocmd BufRead,BufNewFile COMMIT_EDITMSG set textwidth=0

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
" Section: Load packer plugins {{{

lua require('plugins')
lua require('config');

" Load plugin configurations {{{2

" ranger.vim {{{3
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Section: Remaps {{{1

" Normal Mode Remaps {{{2

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
" }}}1
" Section: Theme {{{

syntax enable
if has("termguicolors")  " set true colors
  set termguicolors
endif

colorscheme night_owl

" }}}
" Section: Local-Machine Config {{{

if filereadable($DOTFILES . "/nvim/init.local.vim")
  source $DOTFILES/nvim/init.local.vim
endif
" }}}
