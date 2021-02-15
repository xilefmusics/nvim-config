function! Build()
  if (&ft=='tex')
    let command = 'pdflatex ' . expand('%')
    let response = system(command)
  elseif (&ft=='markdown')
    let command = 'pandoc ' . expand('%') . ' -o ' . expand('%:t:r') . '.pdf'
    let response = system(command . ' &')
  elseif (&ft=='python')
    exec winheight(0)/4."split" | terminal python %
  elseif (&ft=='sh')
    exec winheight(0)/4."split" | terminal sh %
  elseif (&ft=='c' ||  &ft=='h' || &ft=='cpp' || &ft=='hpp')
    exec winheight(0)/4."split" | terminal make run
  elseif (&ft=='rust')
    exec winheight(0)/4."split" | terminal cargo run
  else
    echom('no build function specified for this filetype')
  endif
endfunction

function! Open()
  if (&ft=='tex' || &ft=='markdown')
    let command = 'zathura ' . expand('%:t:r') . '.pdf'
    let response = system(command . ' &')
  else
    echom('no open function specified for this filetype')
  endif
endfunction

function! Clean()
  if (&ft=='tex')
    let file_name = expand('%:t:r')
    let command = 'rm'
    let command = command . ' ' . file_name . '.aux'
    let command = command . ' ' . file_name . '.dvi'
    let command = command . ' ' . file_name . '.fdb_latexmk'
    let command = command . ' ' . file_name . '.fls'
    let command = command . ' ' . file_name . '.log'
    let command = command . ' ' . file_name . '.out'
    let command = command . ' texput.log'
    echom command
    let response = system(command)
  elseif (&ft=='c' ||  &ft=='h' || &ft=='cpp' || &ft=='hpp')
    exec winheight(0)/4."split" | terminal make clean
  else
    echom('no clean function specified for this filetype')
  endif
endfunction

function! Test()
  if (&ft=='rust')
    exec winheight(0)/4."split" | terminal cargo test
  else
    echom('no test function specified for this filetype')
  endif
endfunction
