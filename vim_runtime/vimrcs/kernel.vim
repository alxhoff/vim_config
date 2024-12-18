" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " open tag in new vsplit
    nnoremap g] <C-w>v<C-]>

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose 

    au BufRead,BufNewFile *.dts,*.dtsi set filetype=devicetree
syntax on
" au FileType devicetree setlocal foldmethod=syntax
au FileType devicetree setlocal foldmethod=indent
