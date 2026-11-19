set runtimepath+=~/.vim_runtime


source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/plug.vim
source ~/.vim_runtime/vimrcs/navigation.vim
source ~/.vim_runtime/vimrcs/files.vim
source ~/.vim_runtime/vimrcs/kernel.vim
source ~/.vim_runtime/vimrcs/completion.vim
source ~/.vim_runtime/vimrcs/extended.vim
source ~/.vim_runtime/vimrcs/syntax.vim
source ~/.vim_runtime/vimrcs/format.vim
source ~/.vim_runtime/vimrcs/autopairs.vim
source ~/.vim_runtime/vimrcs/terminal.vim

" 1 tab == 4 columns. Real tabs, not spaces.
" Kernel buffers use 8 (kernel.vim). Python uses spaces (after/ftplugin/python.vim).
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab

" vim-rooter owns cwd: project root, so ./tags resolves at the tree root.
" Kernel tags/cscope are pinned in kernel.vim — see $KERNEL_SRC.
