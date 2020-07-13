let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:fzf_git_checkout_sink(branch)
  let command = 'git checkout ' . a:branch
  let response = system(command)
  execute 'checktime'
endfunction
function! s:fzf_git_checkout()
  let command = 'git branch 2> /dev/null'
  return fzf#run({
        \ 'source': command,
        \ 'sink': function('s:fzf_git_checkout_sink'),
        \ 'options':  '--layout=reverse --info=inline',
        \ 'window':  'new'
        \ })
endfunction
command! Checkout call s:fzf_git_checkout()
