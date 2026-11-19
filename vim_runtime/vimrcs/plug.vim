call plug#begin('~/.vim/plugged')

" Completion. coc owns the menu, docs, and C/Python language servers.
" Snippets expand with Ctrl-j, not Tab (completion.vim).
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'

" Finding files and symbols. fzf is ;, Vista is F8, rooter owns cwd.
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'liuchengxu/vista.vim'
Plug 'chazy/cscope_maps'

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tmhedberg/SimpylFold'
Plug 'bogado/file-line'

" Python style (flake8) only. C and C++ diagnostics come from clangd.
Plug 'w0rp/ale'

Plug 'vhdirk/vim-cmake'
Plug 'tpope/vim-dispatch'
Plug 'kassio/neoterm'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jnurmine/Zenburn'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()
