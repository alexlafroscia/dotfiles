if executable('ag')
	let g:ackprg = 'ag --vimgrep --smart-case'
  let g:ack_use_dispatch = 1
endif
