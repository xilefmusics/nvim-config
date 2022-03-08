" default config
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let g:which_key_map = {}
let g:which_key_use_floating_win = 0
set timeoutlen=0
autocmd! FileType which_key
autocmd FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>

" colors
highlight default link WhichKey Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup Identifier
highlight default link WhichKeyDesc Function

" single mappings
let g:which_key_map[' '] = [':Commands', 'commands']
let g:which_key_map['/'] = [':Rg', 'global search (RG)']
let g:which_key_map['y'] = [':Filetypes', 'change filetype']
let g:which_key_map['B'] = [':call Build()', 'build']
let g:which_key_map['T'] = [':call Test()', 'test']
let g:which_key_map['O'] = [':call Open()', 'open external']
let g:which_key_map['C'] = [':call Clean()', 'clean']
"let g:which_key_map['t'] = [':call Terminal()', 'bottom terminal']
"let g:which_key_map['T'] = [':term', 'terminal']
"
" a for thesis
let g:which_key_map.a = {
      \ 'name' : '+thesis',
      \ 'a': [':Thesis edit', 'edit pdf'],
      \ 'b': [':Thesis build', 'build pdf'],
      \ 'r': [':Thesis buildr', 'build pdf with references'],
      \ 'o': [':Thesis open', 'open pdf'],
      \ 'c': [':Thesis clean', 'clean except tex and pdf'],
      \ 'f': [':Thesis edit_framework', 'edit framework'],
      \}

" f for files
let g:which_key_map.f = {
      \ 'name' : '+files',
      \ 'f': [':Files', 'open file'],
      \ 'c': [':edit ~/.config/nvim/init.vim', 'open config file'],
      \ 'w': [':edit ~/Git/vimwiki/index.md', 'open vimwiki'],
      \}

" b for buffers
let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'b': [':Buffers', 'open buffer'],
      \ 'n': [':new', 'new buffer'],
      \ 'N': [':vnew', 'new vert buffer'],
      \}

" g for git
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'f': [':GFiles', 'open file'],
      \ 'C': [':Commits', 'commits'],
      \ 'B': [':BCommits', 'buffer commits'],
      \ 'b': [':Git blame', 'git blame'],
      \ 'd': [':Git diff', 'git diff'],
      \ 'D': [':Git difftool', 'git difftool'],
      \ 'p': [':Git push', 'git push'],
      \ 'P': [':Git pull', 'git pull'],
      \ 'm': [':Git mergetool', 'git mergetool'],
      \ 'c': [':Checkout', 'git checkout'],
      \}

" w for window
let g:which_key_map.w = {
      \ 'name' : '+window',
      \ 'w': [':Windows', 'change window'],
      \ 'h': ['<C-w>h', 'select left'],
      \ 'j': ['<C-w>j', 'select down'],
      \ 'k': ['<C-w>k', 'select up'],
      \ 'l': ['<C-w>l', 'select right'],
      \ 'c': ['<C-w>c', 'close window'],
      \ '=': ['<C-w>=', 'resize equal'],
      \ 's': ['<C-w>s', 'horizontal split'],
      \ 'v': ['<C-w>v', 'vertical split'],
      \}

" s for spell
let g:which_key_map.s = {
      \ 'name' : '+spell',
      \ 's': [':setlocal spell spelllang=de_DE', 'enable spell check'],
      \ 'd': [':setlocal spell spellang=de_DE', 'language de_DE'],
      \ 'u': [':setlocal spell spellang=en_US', 'language en_US'],
      \ 'D': [':setlocal nospell', 'disable spell check'],
      \}

" c for comments
let g:which_key_map.c = {
      \ 'name' : '+comment',
      \ ' ': [':call NERDComment(0, "Toggle")', 'toggle'],
      \ '$': [':call NERDComment(0, "ToEOL")', 'to EOL'],
      \ 'a': [':call NERDComment()', 'alt delims'],
      \ 'A': [':call NERDComment(0, "append")', 'append'],
      \ 'b': [':call NERDComment(0, "AlignBoth")', 'align both'],
      \ 'c': [':call NERDComment(0, "Comment")', 'comment'],
      \ 'i': [':call NERDComment(0, "Invert")', 'invert'],
      \ 'l': [':call NERDComment(0, "AlignLeft")', 'align left'],
      \ 'm': [':call NERDComment(0, "Minimal")', 'minimal'],
      \ 'n': [':call NERDComment(0, "Nested")', 'nested'],
      \ 's': [':call NERDComment(0, "Sexy")', 'sexy'],
      \ 'u': [':call NERDComment(0, "Uncomment")', 'unkomment'],
      \ 'y': [':call NERDComment(0, "Yank")', 'yank'],
      \}

" p for project
let g:which_key_map.p = {
      \ 'name' : '+project',
      \ 'p': [':Projex fzf', 'open project'],
      \ 'e': [':Projex open_project_list', 'edit project list'],
      \}

" j for jump
let g:which_key_map.j = {
      \ 'name' : '+jump',
      \ 'f': [':Xump file_under_cursor', 'jump to file under cursor'],
      \ 'b': ['<C-o>', 'jump back'],
      \ 'n': ['<C-i>', 'jump forward'],
      \ 'l': [':BLines', 'jump to line'],
      \ 't': [':BTags', 'jump to tag'],
      \ 'd': [':call CocAction("jumpDefinition")', 'jump to definition'],
      \ 'i': [':call CocAction("jumpImplementation")', 'jump to definition'],
      \ 'r': [':call CocAction("jumpReferences")', 'jump to references'],
      \}

" t for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal',
      \ 't': [':terminal', 'terminal'],
      \ 'l': [':FloatermNew --height=0.8 lf', 'run lf'],
      \ 'r': [':FloatermNew --height=0.8 lf', 'run ranger'],
      \ 'g': [':FloatermNew --height=0.8 lazygit', 'run lazygit'],
      \}

" r for rust
let g:which_key_map.r = {
      \ 'name' : '+rust',
      \ 'f': [':RustFmt', 'format code'],
      \ 't': [':RustTest', 'run test under cursor'],
      \ 'p': [':RustPlay', 'send to playground'],
      \ 'd': [':CocCommand rust-analyzer.openDocs', 'open docs'],
      \ 'c': [':CocCommand rust-analyzer.openCargoToml', 'open cargo toml'],
      \}

let g:which_key_map.d = {
      \ 'name' : '+do',
      \ 's': [':SplitjoinSplit', 'split code'],
      \ 'j': [':SplitjoinJoin', 'join code'],
      \ 'l': [':SidewaysLeft', 'move left'],
      \ 'r': [':SidewaysRight', 'move right'],
      \ 'i': ['<Plug>SidewaysArgumentInsertBefore', 'insert argument'],
      \ 'a': ['<Plug>SidewaysArgumentAppendAfter', 'append argument'],
      \ 'I': ['<Plug>SidewaysArgumentInsertFirst', 'insert first argument'],
      \ 'A': ['<Plug>SidewaysArgumentAppendLast', 'append last argument'],
      \}

" register which key map
call which_key#register('<Space>',  "g:which_key_map")
