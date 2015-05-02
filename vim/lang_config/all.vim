" ========================= GENERAL CONFIG ===================================

" Leader
let mapleader = ","

" Set bash as the prompt for Vim
set shell=/usr/local/bin/zsh

" Theme
syntax enable
set background=dark
colorscheme base16-tomorrow

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set t_Co=256      " force vim to use 256 colors
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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


" ======================= NORMAL MODE REMAPS =================================

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

" Smart indent when entering insert mode with i on empty lines
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" Open folder in finder
function! OpenInFinder()
  call system('open ' . getcwd())
endfunction
nnoremap <leader>f :call OpenInFinder()<CR>

" Open current file in Marked
function! MarkedPreview()
  :w
  exec ':silent !open -a "Marked 2.app" ' . shellescape('%:p')
  redraw!
endfunction
nnoremap <leader>md :call MarkedPreview()<CR>

" Open current repo in Tower
function! OpenInGitTower()
  call system('gittower ' . getcwd())
endfunction
nnoremap <leader>gt :call OpenInGitTower()<CR>

" Open current directory in Atom
function! OpenInAtom()
  :w
  exec ':silent !atom ' . shellescape('%:p')
  redraw!
endfunction
nnoremap <leader>a :call OpenInAtom()<CR>


" ======================= INSERT MODE REMAPS =================================

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
