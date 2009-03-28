" For Debian systems
runtime! debian.vim

syntax on
set background=dark

" Jump to last known location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Filetype based indent rules
if has("autocmd")
  filetype indent on
endif

" Some useful defaults from Debian vimrc
set showmatch		" Show matching brackets.
set incsearch		" Incremental search
set ignorecase


"
" My tweaks below
"


" Basic options
set autoindent
set preserveindent
set nosmartindent " messes up e.g. Python comment lines
set smarttab
set ruler
set showcmd
set expandtab
set formatoptions=c
set lbr
set foldmethod=indent
set nofoldenable " Folding off by default on file open
set shellcmdflag=-c
set shell=bash\ -l
colorscheme evening
set modeline
set modelines=5
set laststatus=2
set splitright
set scrolloff=3
set matchtime=2
set nomore
set wildmenu
set wildmode=list:longest
nmap <CR> o<ESC>
set backspace=indent,eol,start
set tabpagemax=100
set switchbuf=usetab
set textwidth=80
set hlsearch

" Ruby
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=syntax

" Markdown
autocmd FileType mkd setlocal ai formatoptions=tcroqn2 comments=n:>

" ReST
autocmd FileType rest setlocal ai formatoptions=tcroqn2 comments=n:> tabstop=2 softtabstop=2 shiftwidth=2

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Python / defaults
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Up/down go visually instead of by physical lines (useful for long wraps)
" Interactive ones need to check whether we're in the autocomplete popup (which
" breaks if we remap to gk/gj)
map <up> gk
inoremap <up> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gk"<Enter>
map <down> gj
inoremap <down> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gj"<Enter>
