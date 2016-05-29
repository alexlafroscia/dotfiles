let b:js_breakpoint_cmd = 'debugger;'

function! JavaScriptBreakpoint(lnum)
  let line = getline(a:lnum)
  if strridx(line, g:js_breakpoint_cmd) != -1
    normal dd
  else
    let plnum = prevnonblank(a:lnum)
    call append(line('.')-1, repeat(' ', indent(plnum)).b:js_breakpoint_cmd)
    normal k
  endif
endfunction

nnoremap <LocalLeader>b :call JavaScriptBreakpoint(line('.'))<CR>
