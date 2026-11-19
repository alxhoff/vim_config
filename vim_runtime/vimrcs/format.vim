" C/C++ format on F3. Implementation: autoload/dotfiles/format.vim
command! -bar DotfilesFormat call dotfiles#format#buffer()

nnoremap <silent> <F3> :DotfilesFormat<CR>
xnoremap <silent> <F3> :<C-u>call dotfiles#format#visual()<CR>
