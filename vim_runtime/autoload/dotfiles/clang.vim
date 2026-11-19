" Auto-apply clangd "Include <…>" quickfix when a libc call was typed without a header.
let s:include_fix_timer = -1

function! dotfiles#clang#schedule_include_fix() abort
  if index(['c', 'cpp'], &filetype) < 0
    return
  endif
  if s:include_fix_timer != -1
    call timer_stop(s:include_fix_timer)
  endif
  let s:include_fix_timer = timer_start(450, { -> dotfiles#clang#apply_include_fix() })
endfunction

function! dotfiles#clang#apply_include_fix() abort
  let s:include_fix_timer = -1
  if index(['c', 'cpp'], &filetype) < 0 || !exists('*CocAction')
    return
  endif
  let l:diags = CocAction('diagnosticList')
  let l:lnum = line('.')
  let l:need = v:false
  for d in l:diags
    if get(d, 'bufnr', 0) != bufnr('%') || get(d, 'lnum', -1) != l:lnum
      continue
    endif
    let l:msg = get(d, 'message', '')
    if l:msg =~# 'undeclared\|Include <'
      let l:need = v:true
      break
    endif
  endfor
  if l:need
    call CocActionAsync('doQuickfix')
  endif
endfunction
