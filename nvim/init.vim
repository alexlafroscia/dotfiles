" Functions used for loading additional config
function! LanguageConfig(filename)
  let l:filename = "lang_config/" . a:filename . ".vim"
  exec "runtime " . l:filename
endfunction

function! PluginConfig(filename)
  let l:filename = "plugin_config/" . a:filename . ".vim"
  exec "runtime " . l:filename
endfunction

" Config file paths to make '$DOTFILES/nvim' visible to runtime
let &runtimepath .= "," . $DOTFILES . "/nvim"

augroup vimrcEx
  autocmd!

  " Load configuration common across all filetypes
  call PluginConfig("vim-plug")
  call LanguageConfig("all")

  " Plugin Configuration
  call PluginConfig("deoplete")
  call PluginConfig("emmet-vim")
  call PluginConfig("fzf")
  call PluginConfig("goyo")
  call PluginConfig("incsearch")
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
augroup END

" -- Local config --------------------------------------------------------------
"    If there are settings that are needed on this machine but that don't need
"    to be synced to the Git repository, they can be put in init.local.vim.
"    Those settings will be read anytime this file is read and will override any
"    settings in here.
if filereadable($DOTFILES . "/nvim/init.local.vim")
  source $DOTFILES/nvim/init.local.vim
endif
