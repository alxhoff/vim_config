" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" https://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"             \ "\<lt>C-n>" :
"             \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"             \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"             \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

" Enable global scope search
let OmniCpp_GlobalScopeSearch = 1
" Show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1
" Show access information in pop-up menu
let OmniCpp_ShowAccess = 1
" Auto complete after '.'
let OmniCpp_MayCompleteDot = 1
" Auto complete after '->'
let OmniCpp_MayCompleteArrow = 1
" Auto complete after '::'
let OmniCpp_MayCompleteScope = 0
" Don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0
set t_Co=256
set tags=./tags;/
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set cscoperelative

" youcompleteme
map <leader>yg :YcmCompleter GoTo<cr>
map <leader>yd :YcmCompleter GetDoc<cr>
map <leader>yt :YcmCompleter GetType<cr>
map <leader>yf :YcmCompleter FixIt<cr>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_max_num_candidates = 100
let g:ycm_max_num_identifier_candidates = 100
let g:ycm_auto_trigger = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tag_files = 1 
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_log_level = 'debug'
let g:ycm_server_log_level = 'debug'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_use_clangd = 0
" let g:ycm_clangd_args = [ '--background-index=false' ]

let g:AutoClosePreserveDotReg = 0
