call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'ternjs/tern_for_vim', {'do' : 'npm install' }
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vhdirk/vim-cmake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'jeaye/color_coded'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'chazy/cscope_maps'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'valloric/youcompleteme'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'chiel92/vim-autoformat'
Plug 'tmhedberg/SimpylFold'
Plug 'Townk/vim-autoclose'
" Plug 'davidhalter/jedi-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'bogado/file-line'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'

call plug#end()
