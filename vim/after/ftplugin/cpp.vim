let b:coc_disabled_sources = ['buffer', 'around']

augroup dotfiles_cpp_coc_includes
  autocmd! * <buffer>
  autocmd InsertLeave <buffer> call dotfiles#clang#schedule_include_fix()
augroup END
