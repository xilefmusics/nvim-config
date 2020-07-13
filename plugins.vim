call plug#begin('~/.local/share/nvim/plugged')
  " Show Keybindings
  Plug 'liuchengxu/vim-which-key'
  " Statuslines
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " Autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Editing
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdcommenter'
call plug#end()
