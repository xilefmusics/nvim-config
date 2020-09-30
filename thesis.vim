let s:thesis_path = $HOME . "/Git/thesis/PDF/"

function! s:edit_thesis()
  exe 'cd ' . s:thesis_path
  exe 'edit main.tex'
endfunction

function! s:build_thesis()
  let l:command = 'pdflatex ' . s:thesis_path . "main.tex"
  let l:response = system(l:command)
endfunction

function! s:buildr_thesis()
  call s:build_thesis()
  exe 'cd ' . s:thesis_path
  let l:command = 'biber main'
  let l:response = system(l:command)
  call s:build_thesis()
endfunction

function! s:open_thesis()
  let l:command = 'zathura ' . s:thesis_path . 'main.pdf'
  let l:response = system(l:command . ' &')
endfunction

function s:clean_thesis()
  exe 'cd ' . s:thesis_path
  let l:command = 'rm main.lof main.toc main.out main.idx main.bcf main.lot main.log main.blg main.alg main.code main.pytxcode main.run.xml main.thm main.wrt main.bbl main.tex.bbl main.tex.blg main.aux texput.log'
  let l:response = system(l:command)
endfunction

function! s:thesis(command)
  if a:command == 'build'
    call s:build_thesis()
  elseif a:command == 'buildr'
    call s:buildr_thesis()
  elseif a:command == 'open'
    call s:open_thesis()
  elseif a:command == 'edit'
    call s:edit_thesis()
  elseif a:command == 'clean'
    call s:clean_thesis()
  else
    echom("ERROR: thesis doesn't know the command: " . a:command)
  endif
endfunction

command! -nargs=1 Thesis call s:thesis(<f-args>)
