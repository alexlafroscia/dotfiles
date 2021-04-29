" Keyboard bindings for LSP functions
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR>

" Configure nvim-lightbuilb to appear near cursor
" https://github.com/kosayoda/nvim-lightbulb#usage
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
