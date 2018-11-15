 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Syntastic (syntax checker)
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:ale_linters = { 
 \   'javascript': ['jshint'],
 \   'python': ['flake8'],
 \   'go': ['go', 'golint', 'errcheck']
 \}

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Git gutter (Git diff)
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:gitgutter_enabled=0
 nnoremap <silent> <leader>d :GitGutterToggle<cr>

