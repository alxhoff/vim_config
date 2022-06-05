call plug#begin('~/.vim/plugged')

Plug 'tmsvg/pear-tree'
Plug 'junegunn/vim-easy-align'
Plug 'ternjs/tern_for_vim', {'do' : 'npm install' }
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vhdirk/vim-cmake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
" Plug 'jeaye/color_coded'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'chazy/cscope_maps'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'valloric/youcompleteme'
Plug 'nvie/vim-flake8'
" Color schemes
Plug 'jnurmine/Zenburn'
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf'

Plug 'chiel92/vim-autoformat'
Plug 'tmhedberg/SimpylFold'
Plug 'Townk/vim-autoclose'
" Plug 'davidhalter/jedi-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'bogado/file-line'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

call plug#end()

set runtimepath+=~/.vim_runtime

" source ~/.vim_runtime/vimrcs/plug.vim

" GENERAL CONFIG

" A buffer becomes hidden when it is abandoned
set hidden

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

"Number of commands saved
set history=500

" Set to auto read when a file is changed from the outside
set autoread

"CTAGS
set autochdir
set tags=./tags,tags,$HOME/Tags

"Show where 81 character is
set colorcolumn=81
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

"Color scheme
syntax on
colorscheme onedark

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif


" Enable filetype plugins
filetype plugin on
filetype indent on

" FORMATTING

"Spelling
set spell spelllang=en

" Automatically insert the current commend leader after hitting enter and
" auto-wrap commends using textwidth
set formatoptions+=r
set formatoptions+=c

" INTERFACE

" The number of lines above and below the cursor that should be visible
set so=20

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Vim menu autocompletion etc
set wildmenu
set wildmode=longest:full,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position at the bottom right
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Search moves as you add characters to search query
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Enable supertab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" turn hybrid line numbers on
set number relativenumber
set nu rnu


" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

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

"Sytastic, shows sytastic errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Not sure what this does
let python_highlight_all=1

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Turn persistent undo on
 "    means that you can undo even when you close a buffer/VIM
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 try
     set undodir=~/.vim_runtime/temp_dirs/undodir
     set undofile
 catch
 endtry


" BINDS

" Leader buttom mapping
let mapleader = ","

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

"Auto Format
" Formats files when saving
au BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatter_yapf_style = 'pep8'

"FZF fuzzy search
map ; :Files<CR>
" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
"CSCOPE MAP
map l :TlistToggle<CR>

"TAG BAR
nmap <F8> :TagbarToggle<CR>


" Saving
" Fast saving
nmap <leader>w :w!<cr>
nmap <Leader>q :q<CR>
nmap <Leader>a :qa!<CR>

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" Formatting
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" NAVIGATION

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Automatically open nerdtree
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeMirror<CR>:NERDTreeFocus<CR>

"folding
set foldmethod=syntax
set foldnestmax=10
set foldlevel=2
command! -bang SimpylFoldDocstrings let b:SimpylFold_fold_docstring = <bang>1 | call SimpylFold#Recache()
command! -bang SimpylFoldImports let b:SimpylFold_fold_import = <bang>1 | call SimpylFold#Recache()

"TABS
" CTRL-Tab is next tab
map <leader>t :tabnew<cr>
" Tab navigation like Firefox.
nnoremap <C-a> :tabprevious<CR>
nnoremap <C-d>   :tabnext<CR>
inoremap <C-a> <Esc>:tabprevious<CR>i
inoremap <C-d>   <Esc>:tabnext<CR>i

" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

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

"COMPLETION

" " Enable OmniCompletion
" " http://vim.wikia.com/wiki/Omni_completion
" " Configure menu behavior
" " http://vim.wikia.com/wiki/VimTip1386
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"             \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"             \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"
" " Use Ctrl+Space for omni-completion
" " https://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
" " inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
" "             \ "\<lt>C-n>" :
" "             \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
" "             \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
" "             \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" " imap <C-@> <C-Space>
"
" " Popup menu hightLight Group
" highlight Pmenu ctermbg=13 guibg=LightGray
" highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
"
" " Enable global scope search
" let OmniCpp_GlobalScopeSearch = 1
" " Show function parameters
" let OmniCpp_ShowPrototypeInAbbr = 1
" " Show access information in pop-up menu
" let OmniCpp_ShowAccess = 1
" " Auto complete after '.'
" let OmniCpp_MayCompleteDot = 1
" " Auto complete after '->'
" let OmniCpp_MayCompleteArrow = 1
" " Auto complete after '::'
" let OmniCpp_MayCompleteScope = 0
" " Don't select first item in pop-up menu
" let OmniCpp_SelectFirstItem = 0
" set t_Co=256
" set tags=./tags;/
" map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Vset cscoperelative

" youcompleteme
map <leader>yg :YcmCompleter GoTo<cr>
map <leader>yd :YcmCompleter GetDoc<cr>
map <leader>yt :YcmCompleter GetType<cr>
map <leader>yf :YcmCompleter FixIt<cr>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '$HOME/.ycm_extra_conf.py'
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
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_use_clangd = 0
" let g:ycm_clangd_args = [ '--background-index=false' ]

let g:AutoClosePreserveDotReg = 0

