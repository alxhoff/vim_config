 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Turn persistent undo on 
 "    means that you can undo even when you close a buffer/VIM
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 try
     set undodir=~/.vim_runtime/temp_dirs/undodir
     set undofile
 catch
 endtry
 
