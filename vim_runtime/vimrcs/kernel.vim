" Linux kernel / BSP navigation: tags and cscope at the tree root only.
" Override $KERNEL_SRC to point at a checkout, or rely on Kconfig+arch detection.

let s:kernel_cscope_db = ''

function! s:KernelRoot() abort
    if exists('$KERNEL_SRC') && isdirectory($KERNEL_SRC)
        return fnamemodify($KERNEL_SRC, ':p')
    endif
    let dir = expand('%:p:h')
    while dir !=# '' && dir !=# '/'
        if filereadable(dir . '/Kconfig')
                    \ && (isdirectory(dir . '/arch') || filereadable(dir . '/Makefile'))
            return fnamemodify(dir, ':p')
        endif
        let dir = fnamemodify(dir, ':h')
    endwhile
    return ''
endfunction

function! s:SetupKernelNavigation() abort
    let root = s:KernelRoot()
    if root ==# ''
        return
    endif

    setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab

    let tags_file = fnamemodify(root . '/tags', ':p')
    if filereadable(tags_file)
        let &l:tags = tags_file
    endif

    let cscope_db = fnamemodify(root . '/cscope.out', ':p')
    if !filereadable(cscope_db)
        return
    endif
    if s:kernel_cscope_db ==# cscope_db
        return
    endif
    if s:kernel_cscope_db !=# ''
        try
            cs kill -1
        catch
        endtry
    endif
    execute 'silent! cs add' fnameescape(cscope_db)
    let s:kernel_cscope_db = cscope_db
endfunction

augroup kernel_navigation
    autocmd!
    autocmd BufEnter *.[ch],*.[ch]xx,*.dts,*.dtsi call s:SetupKernelNavigation()
augroup END

" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetag
set csto=0
nnoremap g] <C-w>v<C-]>
set cscopeverbose

au BufRead,BufNewFile *.dts,*.dtsi set filetype=devicetree
autocmd FileType devicetree setlocal syntax=OFF
