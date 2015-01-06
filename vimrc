" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Set bash as the prompt for Vim
set shell=/bin/bash

" Leader
let mapleader = ","

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set scrolloff=3

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Show hidden files, but only some of them
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_show_hidden = 1

" Make it obvious where 80 characters is
" Lifted from StackOverflow user Jeremy W. Sherman
" http://stackoverflow.com/a/3765575/2250435
if exists('+colorcolumn')
    set textwidth=80
    set colorcolumn=+1
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Numbers
set number
set numberwidth=5

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

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Force you to get used to the Vim keybindings
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Run commands in Tmux
nmap <C-c><C-c> <Plug>NormalModeSentToTmux

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" vim-airline
let g:airline_powerline_fonts = 1 " Enable the patched Powerline fonts

" Custom Keybindings
noremap <Leader>n :NERDTreeToggle<cr>
nnoremap <leader>ri :RunInInteractiveShell<space>
noremap <leader>t :TagbarToggle<cr>

" Solarized
" Only try to activate it if it has been installed
if filereadable($HOME . "/.vim/bundle/vim-colors-solarized/colors/solarized.vim")
  syntax enable
  set background=dark
  colorscheme solarized
  " Color the gutter correctly
  highlight SignColumn ctermbg=8
endif


" -- FUNCTIONS -----------------------------------------------------------------

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
map <leader>md :call MarkedPreview()<CR>


function! OpenInGitTower()
  call system('gittower ' . getcwd())
endfunction
nnoremap <leader>gt :call OpenInGitTower()<CR>

" -- Tagbar --------------------------------------------------------------------

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/opt/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
      \ 's:sections',
      \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
      \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }


" -- vim-markdown --------------------------------------------------------------
let g:vim_markdown_folding_disabled=1 " Disable folding


" -- vim-zenmode ---------------------------------------------------------------
let g:zenmode_background = "dark"
let g:zenmode_colorscheme = "solarized"
let g:zenmode_font ="Cousine 12"


" -- Syntastic -----------------------------------------------------------------

" Silence certain HTML warnings
let g:syntastic_html_tidy_ignore_errors = [
  \  'plain text isn''t allowed in <head> elements',
  \  '<base> escaping malformed URI reference',
  \  'discarding unexpected <body>',
  \  '<script> escaping malformed URI reference',
  \  '</head> isn''t allowed in <body> elements',
  \  'missing <li>',
  \  '<input> isn''t allowed in <body> elements',
  \  'trimming empty <span>',
  \  'trimming empty <i>'
  \ ]

let g:syntastic_coffee_coffeelint_ignore_errors = [
  \  'Backticks are forbidden'
  \ ]

let g:syntastic_handlebars_checkers = ['handlebars']

" -- vim-mustache-handlebars ---------------------------------------------------

let g:mustache_abbreviations = 1

" -- vim-pencil ----------------------------------------------------------------

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md,text call pencil#init({'wrap': 'soft'})
augroup END


" -- vim-goyo ------------------------------------------------------------------

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

let g:limelight_conceal_ctermfg = 'DarkGrey'

" -- Local config --------------------------------------------------------------
"    If there are settings that are needed on this machine but that don't need
"    to be synced to the Git repository, they can be put in .vimrc.local.  Those
"    settings will be read anytime this file is read and will override any
"    settings in here.

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
