"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc (clangd / pyright) owns language-server diagnostics.
" ALE does not start its own servers. It only runs flake8 on Python.
let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \   'python': ['flake8']
            \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>


"NERD COMMENTER
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" 80 characters line
set colorcolumn=81
"execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

"spelling
set spell spelllang=en

" C/C++ format: F3 in format.vim (clang-format; tab-aware fallback).
" Formats files when saving
" au BufWrite * :Autoformat
" noremap <F3> :Autoformat<CR>
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
" let g:formatter_yapf_style = 'pep8'
"
" let g:formatdef_clangformat = '"clang-format"'
" let g:formatters_cpp = ['clangformat']
" let g:formatters_c = ['clangformat']


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

syntax on

autocmd FileType c,cpp setlocal equalprg=clang-format
autocmd FileType h,hpp setlocal equalprg=clang-format
let python_highlight_all=1

" colorscheme zenburn
set t_Co=256
set cursorline
colors deus

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif

