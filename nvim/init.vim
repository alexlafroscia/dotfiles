" Load vim-plug plugins {{{

" Helper functions {{{
" Functions used for loading additional config
function! LanguageConfig(filename)
  let l:filename = "lang_config/" . a:filename . ".vim"
  exec "runtime " . l:filename
endfunction

function! PluginConfig(filename)
  let l:filename = "plugin_config/" . a:filename . ".vim"
  exec "runtime " . l:filename
endfunction
" }}}

" Config file paths to make '$DOTFILES/nvim' visible to runtime
let &runtimepath .= "," . $DOTFILES . "/nvim"

augroup vimrcEx
  autocmd!

  " Load configuration common across all filetypes
  call PluginConfig("vim-plug")

  " Plugin Configuration
  call PluginConfig("deoplete")
  call PluginConfig("emmet-vim")
  call PluginConfig("fzf")
  call PluginConfig("goyo")
  call PluginConfig("incsearch")
  call PluginConfig("jedi-vim")
  call PluginConfig("neomake")
  call PluginConfig("nerdtree")
  call PluginConfig("pytest.vim")
  call PluginConfig("python-mode")
  call PluginConfig("supertab")
  call PluginConfig("tagbar")
  call PluginConfig("ultisnips")
  call PluginConfig("vim-airline")
  call PluginConfig("vim-go")
  call PluginConfig("vim-jsx")
  call PluginConfig("vim-markdown")
  call PluginConfig("vim-mustache-handlebars")
  call PluginConfig("vim-pencil")
  call PluginConfig("vim-rails")
  call PluginConfig("vim-table-mode")
augroup END
" }}}1
" General Config {{{

" Leader
let mapleader = " "

" Set bash as the prompt for Vim
set shell=/usr/local/bin/zsh

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
set timeoutlen=1000 ttimeoutlen=0
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set scrolloff=3
set list listchars=tab:»·,trail:·  " Display extra whitespace characters

" Numbers
set number
set numberwidth=5

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

filetype plugin indent on

" Highlight search matches
set hlsearch

" Make it obvious where 80 characters is
" Lifted from StackOverflow user Jeremy W. Sherman
" http://stackoverflow.com/a/3765575/2250435
if exists('+colorcolumn')
    set textwidth=80
    set colorcolumn=+1
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Automatically clean trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
                                      \ | set textwidth=0

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Normal Mode Remaps {{{

" Force you to get used to the Vim keybindings
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Easier use of tabs
nnoremap tn :tabnew<CR>
nnoremap tx :tabclose<CR>

" Custom Keybindings
noremap <leader>tb :TagbarToggle<cr>

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
" }}}
" External Functions {{{

" -- Open folder in finder -----------------------------------------------------
function! OpenInFinder()
  call system('open ' . getcwd())
endfunction
nnoremap <leader>f :call OpenInFinder()<CR>

" -- Open current file in Marked -----------------------------------------------
function! MarkedPreview()
  :w
  exec ':silent !open -a "Marked 2.app" ' . shellescape('%:p')
  redraw!
endfunction
nnoremap <leader>md :call MarkedPreview()<CR>

" -- Open current repo in Tower ------------------------------------------------
function! OpenInGitTower()
  call system('gittower ' . getcwd())
endfunction
nnoremap <leader>gt :call OpenInGitTower()<CR>

" -- Open current directory in Atom --------------------------------------------
function! OpenInAtom()
  :w
  exec ':silent !atom ' . shellescape('%:p')
  redraw!
endfunction
nnoremap <leader>a :call OpenInAtom()<CR>
" }}}
" Insert Mode Remaps {{{

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
" }}}
" }}}
" Theme {{{
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set background=dark

" Gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'medium'
colorscheme gruvbox

" Setup Terminal Colors For Neovim: {{{
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
endif
" }}}
" }}}
" Local-Machine Config {{{
" If there are settings that are needed on this machine but that don't need
" to be synced to the Git repository, they can be put in init.local.vim.
" Those settings will be read anytime this file is read and will override any
" settings in here.
if filereadable($DOTFILES . "/nvim/init.local.vim")
  source $DOTFILES/nvim/init.local.vim
endif
" }}}
