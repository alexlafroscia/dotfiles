let g:js_breakpoint_cmd = 'debugger;'

function! JavaScriptBreakpoint(lnum)
  let line = getline(a:lnum)
  if strridx(line, g:js_breakpoint_cmd) != -1
    normal dd
  else
    let plnum = prevnonblank(a:lnum)
    call append(line('.')-1, repeat(' ', indent(plnum)).g:js_breakpoint_cmd)
    normal k
  endif
endfunction

nnoremap <LEADER>b :call JavaScriptBreakpoint(line('.'))<CR>

