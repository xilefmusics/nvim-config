" german Umlaute
inoremap ,ae ä
inoremap ,oe ö
inoremap ,ue ü
inoremap ,Ae Ä
inoremap ,Oe Ö
inoremap ,Ue Ü
inoremap ,ss ß

" substitute word
map <F2> :%s/\<<C-r><C-w>\>/

" keep visualmode when indent
vnoremap < <gv
vnoremap > >gv

" move lines
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '>-2<CR>gv=gv
nnoremap <C-j> :m +1<CR>gv=gv
nnoremap <C-k> :m -2<CR>gv=gv

" ESC in terminal
tnoremap <C-t> <C-\><C-n>
