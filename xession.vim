let s:xession_path_to_Xession = $HOME . "/.config/nvim/Xession/"

function s:xession_get_buffers()
  let l:list = []
  for i in range(0, bufnr('$'))
    if buflisted(i)
      "call add(l:list, bufname(i))
      call add(l:list, bufwinid(i))
    endif
  endfor
  echo l:list
endfunction

function s:xession(command)
  call s:xession_get_buffers()
endfunction

command! -nargs=1 Xession call s:xession(<f-args>)
