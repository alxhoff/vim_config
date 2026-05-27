set runtimepath+=~/.vim_runtime


source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/plug.vim
source ~/.vim_runtime/vimrcs/navigation.vim
source ~/.vim_runtime/vimrcs/files.vim
source ~/.vim_runtime/vimrcs/kernel.vim
source ~/.vim_runtime/vimrcs/completion.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/syntax.vim
source ~/.vim_runtime/vimrcs/autopairs.vim

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" autochdir: cwd follows the open file (good for ./tags in small projects).
" Kernel tags/cscope are pinned to the tree root in kernel.vim — see $KERNEL_SRC.
set autochdir
