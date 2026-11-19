" Buffer/around sources only paste words — they do not apply clangd #include edits.
let b:coc_disabled_sources = ['buffer', 'around']

augroup dotfiles_c_coc_includes
  autocmd! * <buffer>
  autocmd InsertLeave <buffer> call dotfiles#clang#schedule_include_fix()
augroup END
