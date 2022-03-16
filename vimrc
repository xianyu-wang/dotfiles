" nnoremap <SPACE> <Nop>
let mapleader=","
set nocompatible
set number
syntax on "highlight syntax
set showmode
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256
set belloff=all

" Indentation
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Apprearance
set relativenumber " use relative line number
set cursorline
set wrap
set linebreak
set scrolloff=5
set ruler

" Search
set smartcase

" Edit
set undofile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set listchars=tab:»■,trail:■
set list
set autoread
set clipboard=unnamed
set noerrorbells
set history=1000
set whichwrap+=<,>,h,l
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Command line auto complete
set wildmenu
set wildmode=longest,list,full

" --------------- Plugin
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'IngoMeyer441/coc_current_word'

call plug#end()

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" python-syntax
let g:python_highlight_all = 1

" coc

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc_current_word
hi CurrentWord ctermbg=1 cterm=underline,bold
let g:coc_current_word_highlight_delay = 1000
