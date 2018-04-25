let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': [$ASDF_DIR . '/installs/nodejs/9.3.0/bin/node', $ASDF_DIR . '/installs/nodejs/9.3.0/.npm/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'javascript.jsx': [$ASDF_DIR . '/installs/nodejs/9.3.0/bin/node', $ASDF_DIR . '/installs/nodejs/9.3.0/.npm/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'handlebars': [$ASDF_DIR . '/installs/nodejs/9.3.0/bin/node', $ASDF_DIR . '/installs/nodejs/9.3.0/.npm/lib/node_modules/@emberwatch/ember-language-server/lib/start-server.js'],
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
