set guifont=JetBrainsMono\ Nerd\ Font:h15

nnoremap <D-=> :set guifont=JetBrainsMono\ Nerd\ Font:h16<CR>
nnoremap <D--> :set guifont=JetBrainsMono\ Nerd\ Font:h14<CR>

" ============================================================================
" Core sanity
" ============================================================================

set nocompatible              " Use Vim, not vi
set encoding=utf-8
set fileencoding=utf-8
set hidden                    " Allow background buffers
set updatetime=300
set shortmess+=c
set signcolumn=yes
set nowrap
set scrolloff=5
set sidescrolloff=5

" ============================================================================
" UI / Appearance
" ============================================================================

syntax enable
set number
set relativenumber
set cursorline
set showcmd
set showmode
set ruler
set laststatus=2
set wildmenu
set wildmode=longest:full,full

set termguicolors             " True color
set background=dark
colorscheme desert            " Safe default; override if you prefer

" ============================================================================
" Indentation & whitespace
" ============================================================================

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent

set list
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:␣

" ============================================================================
" Searching
" ============================================================================

set ignorecase
set smartcase
set incsearch
set hlsearch

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" ============================================================================
" Editing behavior
" ============================================================================

set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set clipboard=unnamedplus     " macOS + modern Linux
set splitbelow
set splitright

" Persistent undo
set undofile
set undodir=~/.vim/undo//

" ============================================================================
" Files & backups
" ============================================================================

set nobackup
set nowritebackup
set noswapfile

set autoread
au FocusGained,BufEnter * checktime

" ============================================================================
" Navigation mappings
" ============================================================================

nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ============================================================================
" Leader mappings
" ============================================================================

let mapleader=" "

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>x :x<CR>

" ============================================================================
" Filetype-specific behavior
" ============================================================================

filetype plugin indent on

autocmd FileType markdown setlocal wrap linebreak
autocmd FileType markdown setlocal spell

autocmd FileType yaml setlocal ts=2 sw=2 sts=2
autocmd FileType json setlocal ts=2 sw=2 sts=2

" ============================================================================
" Completion
" ============================================================================

set completeopt=menuone,noinsert,noselect
set omnifunc=syntaxcomplete#Complete

" ============================================================================
" MacVim / GUI compatibility
" ============================================================================

if has("gui_running")
  set guioptions=
  set guicursor=
  set linespace=0
endif

" ============================================================================
" Quality-of-life
" ============================================================================

" Yank highlight
augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   execute "normal! g`\"" |
  \ endif

" ============================================================================
" Performance
" ============================================================================

set lazyredraw
set ttyfast

