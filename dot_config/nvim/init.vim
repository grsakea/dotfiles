" Setup stuff
" ===========

set shell=bash
set shellpipe=2>/dev/null>

" Plugins here
" =============
call plug#begin('~/.local/share/nvim/plugged')

" Theme
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Language
Plug 'vivien/vim-addon-linux-coding-style'
Plug 'ingydotnet/yaml-vim'
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'cespare/vim-toml'

" Misc
Plug 'mhinz/vim-grepper'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug '/usr/bin/fzf'
Plug 'luochen1990/rainbow'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

"Pull in matchit.vim, which is already bundled with Vim
runtime! macros/matchit.vim

" Appearance
" ==========
syntax enable
set background=dark
set termguicolors
colorscheme solarized8
let g:rainbow_active = 1

set noshowmode                                  " Let airline handle the mode display

" General Config
" ==============

let mapleader=','               " I just use the default Leader
let g:mapleader=','             " I just use the default Leader
set number                      " Line numbers are nice
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show status line
set hidden                      " Buffers can exist in the background
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
set shortmess=filnxtToOI        " see :help shortmess
set clipboard+=unnamedplus

nnoremap k gk
nnoremap j gj

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Leader commands
" =====

nmap <leader>w :w!<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>

map <leader>ss :setlocal spell!<cr>

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

map <silent> <leader><cr> :noh<cr>

" Search Settings
" ===============

set ignorecase
set smartcase
set incsearch        " Find the next match as we type the search
set hlsearch         " Highlight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks

" Turn Off Swap Files
" ===================
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" Indentation and Display
" =======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set wrap                              " wrap lines

" Folds
" =====
set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
" ==========
set wildmode=longest,list,full
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Custom commands
" ===============

"Let K be the opposite of J
map <leader>rr :source ~/.vimrc<CR>

" Plugin Options
" ==============

" vim-test
" ========
let test#strategy = "neovim"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" LanguageClient
" ==============
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

" NerdTree
" ========
map <C-n> :NERDTreeToggle<CR>

" FZF
" ===
map <C-p> :FZF<CR>

" Airline options
" ===============
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

let g:deoplete#enable_at_startup = 1

let g:python3_host_prog = '/home/jb/.pyenv/versions/pynvim/bin/python'
let g:python_host_prog = '/home/jb/.pyenv/versions/py2_pynvim/bin/python'

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
