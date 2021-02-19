" Navigate to the next/previous change
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Undo the hunk under the cursor
nnoremap <leader>hu :GitGutterUndoHunk<cr>

" Stage the hunk under the cursor
nnoremap <leader>hs :GitGutterStageHunk<cr>

" Preview the hunk under the cursor
nnoremap <leader>hp :GitGutterPreviewHunk<cr>
