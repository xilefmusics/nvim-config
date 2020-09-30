function! s:xump_file_under_cursor()
  exec "edit " . expand("<cfile>")
endfunction

function! s:xump(command)
  echom(a:command)
  if a:command == 'file_under_cursor'
    call s:xump_file_under_cursor()
  else
    echom("ERROR: xump does'nt know the command " . a:command)
  endif
endfunction

command! -nargs=1 Xump call s:xump(<f-args>)
