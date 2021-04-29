"
" Vundle
"
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'flazz/vim-colorschemes'
Plugin 'junegunn/vim-xmark', { 'do': 'make'}
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'simnalamburt/vim-mundo'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'gkz/vim-ls'
Plugin 'slim-template/vim-slim'
Plugin 'sophacles/vim-processing'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'roxma/nvim-yarp'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'
Plugin 'HansPinckaers/ncm2-jedi'
Plugin 'tweekmonster/impsort.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
Plugin 'davidhalter/jedi-vim'
" Fast python completion (use ncm2 if you want type info or snippet support)
" Words in buffer completion
call vundle#end()

syntax on
filetype plugin indent on

"
" Haskell
"

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`

let g:haskell_classic_highlighting = 1

let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:cabal_indent_section = 2

" ncm
" enable ncm2 for all buffers
let g:python3_host_prog='/usr/bin/python3'
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"Python linter (disabled Convention, Refactor, Warning options)"
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = ['--disable=C,R,W']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>
"Ctrl-w + e shall enable checking
"Ctrl-w + f shall disable checking
"To disable warnings use:
let g:syntastic_quiet_messages={'level':'warnings'}
"Impsort option
hi pythonImportedObject ctermfg=127
hi pythonImportedFuncDef ctermfg=127
hi pythonImportedClassDef ctermfg=127
"
" vimrc
"
set enc=utf-8
set backspace=indent,eol,start
set diffopt+=iwhite
set laststatus=2
set pastetoggle=<F8>
set scrolloff=3
set switchbuf+=usetab,split
set ruler
set startofline
set splitbelow
set nobackup
set nofoldenable
set noshowmode
set noswapfile
set nowrap
syntax on
colorscheme elflord
" History
set history=1024
set undolevels=1024
" Indention
set cindent
set autoindent
set smartindent
" Tab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch
set nowrapscan
" Pair matching
set matchpairs+=<:>
set showmatch
highlight MatchParen ctermfg=black ctermbg=lightgreen
" Wildmenu settings
set wildmenu
set wildmode=full
highlight StatusLine ctermbg=darkgray ctermfg=234
highlight WildMenu ctermfg=white ctermbg=234
" listchars for whitespaces
set list
set listchars=tab:›\ ,extends:»,precedes:«
highlight NonText ctermfg=darkblue
highlight SpecialKey ctermfg=darkblue
" Concealing
set concealcursor=nc
set conceallevel=2
highlight Conceal ctermfg=darkblue ctermbg=NONE
" Key mapping
let mapleader = ","
" NERDTree
nnoremap <C-F> :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" Easy file save
nnoremap <silent> S :update<CR>
" Easy navigation
noremap <up> gk
noremap <down> gj
" Easy indentation
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Easy splitting & resizing
nnoremap <silent> <C-_> :split<CR>
nnoremap <silent> <C-\> :vertical split<CR>
nnoremap <silent> <C-h> :vertical resize -5<CR>
nnoremap <silent> <C-j> :resize -3<CR>
nnoremap <silent> <C-k> :resize +3<CR>
nnoremap <silent> <C-l> :vertical resize +5<CR>
" Tab navigations
nnoremap <esc>t :tabnew<CR>
nnoremap <esc>1 1gt
nnoremap <esc>2 2gt
nnoremap <esc>3 3gt
nnoremap <esc>4 4gt
nnoremap <esc>5 5gt
nnoremap <esc>6 6gt
nnoremap <esc>7 7gt
nnoremap <esc>8 8gt
nnoremap <esc>9 9gt
" Decoration for 80 column layout concerns
set textwidth=80
set colorcolumn=+1,+2,+3
highlight ColorColumn ctermbg=black
" Decoration for line number column
set number
set cursorline
highlight LineNr ctermbg=black
highlight CursorLine cterm=none
highlight CursorLineNr ctermfg=white ctermbg=black
"
let g:rainbow_active = 1
" gundo.vim
let g:gundo_right = 1
nnoremap <leader>g :GundoToggle<CR>
" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" vim-indent-guides
nmap <leader>i <Plug>IndentGuidesToggle
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0
autocmd VimEnter,Colorscheme *
\ if &softtabstop < 4 |
\ highlight IndentGuidesOdd ctermbg=NONE |
\ highlight IndentGuidesEven ctermbg=black |
\ else |
\ let g:indent_guides_guide_size = 1 |
\ highlight IndentGuidesOdd ctermbg=black |
\ highlight IndentGuidesEven ctermbg=black |
\ endif
" vim-better-whitespace
let g:strip_whitespace_on_save = 1
" vim-javascript
let g:javascript_conceal_function = "ƒ"
let g:javascript_conceal_null = "ø"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "⇚"
let g:javascript_conceal_undefined = "¿"
let g:javascript_conceal_NaN = "ℕ"
let g:javascript_conceal_prototype = "¶"

set tags=tags

set clipboard+=unnamedplus
map <F3> "+Y
map <F4> "+gP
vmap <F3> "+y
vmap <F4> "+gP
imap <F4> <ESC>"+gPi

"let g:clipboard = {
"          \   'name': 'myClipboard',
"          \   'copy': {
"          \      '+': ['tmux', 'load-buffer', '-'],
"          \      '*': ['tmux', 'load-buffer', '-'],
"          \    },
"          \   'paste': {
"          \      '+': ['tmux', 'save-buffer', '-'],
"          \      '*': ['tmux', 'save-buffer', '-'],
"          \   },
"          \   'cache_enabled': 1,
"          \ }
"
" Jedi-vim ------------------------------
" Disable autocompletion (using deoplete instead)
" let g:jedi#completions_enabled = 0
" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>
