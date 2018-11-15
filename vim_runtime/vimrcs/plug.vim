call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'chazy/cscope_maps'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

call plug#end()
