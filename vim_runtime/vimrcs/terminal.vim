" Small build/run terminal. Settings must exist before the neoterm plugin loads.
" F4 toggles a 12-line terminal at the bottom.
" F5 builds: make when a Makefile is in the working directory, otherwise gcc/g++
" on the current file. Errors open in the quickfix list.
" F6 runs the executable named after the current file (path with the extension removed).
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = 12
let g:neoterm_autoinsert = 0
let g:neoterm_autojump = 0
let g:neoterm_autoscroll = 1
let g:neoterm_automap_keys = ''
let g:dispatch_quickfix_height = 12

function! s:HasMakefile() abort
  return filereadable('Makefile') || filereadable('makefile') || filereadable('GNUmakefile')
endfunction

function! s:CBuild() abort
  if &modified && expand('%') !=# ''
    update
  endif
  if s:HasMakefile()
    Make
    return
  endif
  if index(['c', 'cpp'], &filetype) < 0 || expand('%') ==# '' || !filereadable(expand('%:p'))
    echomsg 'No Makefile here. Open a C or C++ file to compile it directly.'
    return
  endif
  let l:compiler = &filetype ==# 'cpp' ? 'g++' : 'gcc'
  let l:std = &filetype ==# 'cpp' ? 'c++17' : 'c11'
  let l:saved_makeprg = &l:makeprg
  let l:saved_efm = &l:errorformat
  let l:saved_compiler = get(b:, 'current_compiler', '')
  try
    silent compiler gcc
    let &l:makeprg = printf('%s -Wall -Wextra -g -std=%s -I %s -o %s %s',
          \ l:compiler, l:std,
          \ shellescape(expand('%:p:h')),
          \ shellescape(expand('%:p:r')),
          \ shellescape(expand('%:p')))
    Make
  finally
    let &l:makeprg = l:saved_makeprg
    let &l:errorformat = l:saved_efm
    if l:saved_compiler !=# ''
      let b:current_compiler = l:saved_compiler
    else
      unlet! b:current_compiler
    endif
  endtry
endfunction

function! s:FocusTerm() abort
  if !exists('g:neoterm') || !g:neoterm.has_any()
    return
  endif
  let l:instance = g:neoterm.last()
  let l:winnr = bufwinnr(l:instance.buffer_id)
  if l:winnr > 0
    execute l:winnr . 'wincmd w'
    startinsert
  endif
endfunction

function! s:CRun() abort
  let l:bin = expand('%:p:r')
  if l:bin ==# '' || !executable(l:bin)
    echomsg 'No executable for this file. Build it with F5, then run again.'
    return
  endif
  call neoterm#open({'mod': 'botright'})
  execute 'T' shellescape(l:bin)
  call s:FocusTerm()
endfunction

nnoremap <silent> <F4> :Ttoggle<CR>
tnoremap <silent> <F4> <C-\><C-n>:Ttoggle<CR>
nnoremap <silent> <F5> :call <SID>CBuild()<CR>
nnoremap <silent> <F6> :call <SID>CRun()<CR>
