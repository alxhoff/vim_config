" clang-format for C/C++ (F3). Tab-aware fallback; see vimrcs/format.vim for key maps.

function! dotfiles#format#has_style_file() abort
  let l:dir = expand('%:p:h')
  while l:dir !=# '' && l:dir !=# '/'
    if filereadable(l:dir . '/.clang-format') || filereadable(l:dir . '/_clang-format')
      return 1
    endif
    let l:dir = fnamemodify(l:dir, ':h')
  endwhile
  return 0
endfunction

function! dotfiles#format#fallback_style() abort
  let l:sw = shiftwidth()
  if &l:expandtab
    return printf('{BasedOnStyle: LLVM, IndentWidth: %d, UseTab: Never}', l:sw)
  endif
  return printf('{BasedOnStyle: LLVM, IndentWidth: %d, UseTab: Always, TabWidth: %d}',
        \ l:sw, &l:tabstop)
endfunction

function! dotfiles#format#lines(line1, line2) abort
  let l:cmd = get(g:, 'clang_format#command', 'clang-format')
  if !executable(l:cmd)
    echoerr 'clang-format is not installed'
    return
  endif

  let l:args = printf('-lines=%d:%d ', a:line1, a:line2)
  if dotfiles#format#has_style_file()
    let l:args .= '-style=file '
  else
    let l:args .= '-style=' . shellescape(dotfiles#format#fallback_style()) . ' '
  endif
  let l:fname = expand('%:p')
  if l:fname !=# ''
    let l:args .= '-assume-filename=' . shellescape(l:fname) . ' '
  endif

  let l:pos = getpos('.')
  let l:source = join(getline(1, '$'), "\n")
  let l:formatted = system(l:cmd . ' ' . l:args . '--', l:source)
  if v:shell_error !=# 0
    echoerr 'clang-format failed to format'
    if l:formatted !=# ''
      echomsg l:formatted
    endif
    return
  endif

  let l:winview = winsaveview()
  let l:lines = split(l:formatted, '\n', 1)
  silent! undojoin
  if line('$') > len(l:lines)
    execute len(l:lines) . ',$delete _'
  endif
  call setline(1, l:lines)
  call winrestview(l:winview)
  call setpos('.', l:pos)
endfunction

function! dotfiles#format#buffer() abort
  call dotfiles#format#lines(1, line('$'))
endfunction

function! dotfiles#format#visual() abort
  call dotfiles#format#lines(line("'<"), line("'>"))
endfunction
