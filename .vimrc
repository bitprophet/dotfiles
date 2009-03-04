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
set smarttab
set preserveindent
set ruler
set showcmd
set expandtab
set formatoptions=c
set lbr
set foldmethod=indent
set nofoldenable " Folding off by default on file open
set shellcmdflag=-lc
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
set autoindent
set smartindent

" Ruby
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=syntax

" Markdown
autocmd FileType mkd setlocal ai formatoptions=tcroqn2 comments=n:>

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Python / defaults
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Up/down go visually instead of by physical lines (useful for long wraps)
map <up> gk
inoremap <up> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gk"<Enter>
map <down> gj
inoremap <down> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gj"<Enter>
