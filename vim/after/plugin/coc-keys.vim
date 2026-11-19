" Runs after UltiSnips (after/plugin) and auto-pairs so these keys stay with coc.
" Tab opens the completion menu, then moves the selection.
" Enter uses select_confirm so item 0 is chosen when nothing is highlighted yet.
" Pick a clangd item with a leading dot (•) when it will add #include.
" Typing '(' after printf also accepts the completion when the menu is open.
" If it is a function, clangd inserts parameter placeholders; Tab / S-Tab walk them.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#jumpable() ? "\<C-r>=coc#snippet#next()\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ coc#jumpable() ? "\<C-r>=coc#snippet#prev()\<CR>" :
      \ "\<C-h>"
inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#select_confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
