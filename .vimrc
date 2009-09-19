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
  filetype indent plugin on
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
set formatoptions=tcroqn2 
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
set backspace=indent,eol,start
set tabpagemax=100
set switchbuf=usetab
set textwidth=79

" MacVim
if has("gui_macvim")
    set transparency=15
    set guifont=Inconsolata-dz:h12
    set lines=60
    set formatoptions-=t
    set formatoptions-=c
endif

" Ruby
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=syntax

" Markdown
autocmd FileType mkd setlocal ai comments=n:>

" ReST
autocmd BufRead *.rst setlocal filetype=rest
autocmd FileType rest setlocal ai comments=n:>

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Python / defaults
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Apache! no more comments in headers!
autocmd BufRead /etc/apache2/*,/etc/httpd/* setlocal filetype=apache

" Up/down go visually instead of by physical lines (useful for long wraps)
" Interactive ones need to check whether we're in the autocomplete popup (which
" breaks if we remap to gk/gj)
map <up> gk
inoremap <up> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gk"<Enter>
map <down> gj
inoremap <down> <C-R>=pumvisible() ? "\<lt>down>" : "\<lt>C-o>gj"<Enter>

" Custom mapping shortcut for :nohl
nmap <C-N> :noh<CR>

" Map normal mode Enter to add a new line
nmap <Enter> o<Esc>


"
" netrw (builtin file-browser plugin) preferences
"

" Default to tree view 
let g:netrw_liststyle = 3

" Hide common hidden files
let g:netrw_list_hide = '.*\.py[co]$,\.git$,\.swp$'


"
" Snippets
"

function! NextLineIsOnly(char)
    return getline(line(".")+1) =~ "^" . a:char . "\\+$"
endf

function! ReplaceNextLineWith(char)
    return "yyjVpVr" . a:char
endf

function! ReplaceSurroundingsWith(char)
    return ReplaceNextLineWith(a:char) . "yykkVp"
endf

function! AppendLineOf(char)
    return "yypVr" . a:char
endf

function! SurroundWith(char)
    return AppendLineOf(a:char) . "yykP"
endf

function! H1()
    let char = "="
    if NextLineIsOnly(char)
        return ReplaceSurroundingsWith(char)
    else
        return SurroundWith(char)
    endif
endf

function! H(char)
    if NextLineIsOnly(a:char)
        return ReplaceNextLineWith(a:char)
    else
        return AppendLineOf(a:char)
    endif
endf

nnoremap <expr> <F1> H1()
nnoremap <expr> <F2> H("=")
nnoremap <expr> <F3> H("-")
