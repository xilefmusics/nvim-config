let s:projex_path_to_Projex = $HOME . "/.config/nvim/Projex/"

function! s:projex_load_project_list()
  let l:list = readfile(s:projex_path_to_Projex . "project_list")
  for i in range(len(l:list))
    let l:list[i] = split(l:list[i])
  endfor
  return l:list
endfunction

function! s:projex_load_project(project)
  exe "cd " . a:project[0]
  if a:project[1] == "-"
    exe "edit " . a:project[0]
  else
    exe "edit " . a:project[1]
  endif
endfunction

function! s:projex_fzf_select_project()
  let l:projects = s:projex_load_project_list()
  for i in range(len(l:projects))
    let l:projects[i] = l:projects[i][2] . ' '  . l:projects[i][0]
  endfor
  return fzf#run({
        \ 'source': l:projects,
        \ 'sink': function('s:projex_fzf_select_project_sink'),
        \ 'options':  '--layout=reverse --info=inline',
        \ 'window':  'new'
        \ })
endfunction

function! s:projex_fzf_select_project_sink(sink)
  let l:projects = s:projex_load_project_list()
  let l:selected = split(a:sink)[1]
  for l:project in l:projects
    if l:project[0] == l:selected
      call s:projex_load_project(l:project)
      return
    endif
  endfor
endfunction

function s:projex(command)
  if a:command == "fzf"
    call s:projex_fzf_select_project()
  elseif a:command == "open_project_list"
    exe "edit " . s:projex_path_to_Projex . "project_list"
  else
    echom("ERROR: projex doesn't know the command: " . a:command)
  endif
endfunction

command! -nargs=1 Projex call s:projex(<f-args>)
