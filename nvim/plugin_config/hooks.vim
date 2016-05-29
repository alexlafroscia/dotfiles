" Update remote Neovim plugins
" Taken from https://github.com/junegunn/vim-plug/issues/125#issuecomment-77770584
function! hooks#remote(info)
  if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
    UpdateRemotePlugins
    echom 'Remember to restart!'
  endif
endfunction
