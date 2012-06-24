"
" Load Pathogen for easy bundling of plugins
"
call pathogen#runtime_append_all_bundles()


"
" Load Debian paths/etc when applicable
"

runtime! debian.vim


"
" Basic/common settings
"

" Colorization/display

" Syntax highlighting!
syntax on
" Slower but better syncing -- hopefully no more dumb broken syntax
syntax sync fromstart
" Colorize for a dark background
set background=dark
" 256 colors!
set t_Co=256
colorscheme desert256
" Show ruler line at bottom of each buffer
set ruler
" Show additional info in the command line (very last line on screen) where
" appropriate.
set showcmd
" Always display status lines/rulers
set laststatus=2

" Navigation/search

" Show matching brackets/parentheses when navigating around
set showmatch
" Show matching parens in 2/10 of a second. No idea why I wanted this.
set matchtime=2
" Search incrementally instead of waiting for me to hit Enter
set incsearch
" Search case-insensitively
set ignorecase
" But be smart about it -- if I have any caps in my term, be case-sensitive.
set smartcase
" Don't highlight search terms by default.
set nohls

" Formatting

" Automatically indent based on current filetype
set autoindent
" Don't unindent when I press Enter on an indented line
set preserveindent
" 'smartindent', however, screws up Python -- so turn it off
set nosmartindent
" Make tabbing/deleting honor 'shiftwidth' as well as 'softtab' and 'tabstop'
set smarttab
" Use spaces for tabs
set expandtab
" When wrapping/formatting, break at 79 characters. 
set textwidth=79
" Also make it visually obvious where that line is.
"highlight OverLength ctermbg=88 ctermfg=white
"match OverLength /\%80v.\+/
" By default, all indent/tab stuff is 4 spaces, as God intended.
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Default autoformatting options:
" t: automatically hard-wrap based on textwidth (NO LONGER USED)
" c: do the same for comments, but autoinsert comment character too
" r: also autoinsert comment character when making new lines after existing
"    comment lines
" o: ditto but for o/O in normal mode
" q: Allow 'gq' to autowrap/autoformat comments as well as normal text
" n: Recognize numbered lists when autoformatting (don't explicitly need this,
"    was probably in a default setup somewhere.)
" 2: Use 2nd line of a paragraph for the overall indentation level when
"    autoformatting. Good for e.g. bulleted lists or other formats where first
"    line in a paragraph may have a different indent than the rest.
set formatoptions=croqn2
" Try to break on specific characters instead of the very last character that
" might otherwise fit. Don't remember exactly why this is here but I'm happy
" with how things wrap now...
set lbr

" Behavior

" Allow folding to play nice with Python and other well-indented code
set foldmethod=indent
" Don't close all folds by default when file opens
set nofoldenable
" "zsh -l -c <command>" for :sh and :!
" (so it sources my .zshrc and so forth)
set shellcmdflag=-c
set shell=/bin/zsh\ -l
" Honor Vim modelines at top/bottom of files
set modeline
" Look 5 lines in for modelines (default is sometimes just 1 or 2 which may not
" be enough for some files)
set modelines=5
" When splitting, put new windows to the right (vertical) or below (horizontal)
set splitright splitbelow
" Start scrolling up/down when cursor gets to 3 lines away from window edge
set scrolloff=3
" Don't use 'more' for shell output automatically.
set nomore
" Use bash-like tab completion in Vim command line
set wildmenu
set wildmode=list:longest
" Allow backspaces to eat indents, end-of-line/beginning-of-line characters
set backspace=indent,eol,start
" Let me open a shitton of tabs at once if I really want.
set tabpagemax=100
" Make :sb let me navigate between all windows and tabs
set switchbuf=usetab

" Jump to last known location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Filetype based indent rules
if has("autocmd")
  filetype indent plugin on
endif

" Automatically update local cwd for file in current buffer
" if exists('+autochdir')
"   set autochdir
" else
"   autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
" endif

"
" Settings for specific versions of Vim
"

" MacVim
if has("gui_macvim")
    set transparency=5
    set guifont=Consolas:h14
    set lines=60
    set formatoptions-=t
    set formatoptions-=c
endif


"
" Settings for specific filetypes
"

" Ruby and related
autocmd BufNewFile,BufRead Gemfile,Vagrantfile setlocal filetype=ruby
autocmd BufNewFile,BufRead *.tt,*.citrus setlocal filetype=treetop
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=syntax

" Markdown
autocmd BufNewFile,BufRead *.txt setlocal filetype=markdown
autocmd FileType markdown setlocal ai comments=n:> spell

" ReST
autocmd BufNewFile,BufRead *.rst,*.rest setlocal filetype=rst
autocmd FileType rst setlocal ai comments=n:> spell

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" No more need to drop modelines into common Apache files
" (both Debian and RedHat style Apache conf dirs)
autocmd BufNewFile,BufRead /etc/apache2/*,/etc/httpd/* setlocal filetype=apache

" Same for nginx
autocmd BufNewFile,BufRead */etc/nginx/* setlocal ft=nginx

" JSON
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" Zsh
autocmd BufNewFile,BufRead ~/.zsh* setlocal filetype=zsh

" Io
autocmd BufNewFile,BufRead *.io setlocal ft=io

" Racket/Scheme
autocmd BufNewFile,BufRead *.rkt setlocal tabstop=2 softtabstop=2 shiftwidth=2 ft=scheme


"
" Key mappings
"

" Custom leader
let mapleader=" "

" Insert blank lines w/o leaving normal mode
nmap <Leader><CR> o<Esc>

" Tab/split nav
nmap <Leader>[ :tabp<CR>
nmap <Leader>] :tabn<CR>
nmap <Leader><Left> <C-w><Left>
nmap <Leader><Right> <C-w><Right>
nmap <Leader><Up> <C-w><Up>
nmap <Leader><Down> <C-w><Down>

" Paragraph formatting
nmap <Leader>f gqap
vmap <Leader>f gq

" :w shortcut
nmap <Leader>s :w<CR>

" hidden files toggle
nmap <Leader>h :set list!<CR>

" paste/nopaste toggle
nmap <Leader>p :set paste!<CR>

" Up/down go visually instead of by physical lines (useful for long wraps)
" Interactive ones need to check whether we're in the autocomplete popup (which
" breaks if we remap to gk/gj)
map <up> gk
inoremap <up> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gk"<Enter>
map <down> gj
inoremap <down> <C-R>=pumvisible() ? "\<lt>down>" : "\<lt>C-o>gj"<Enter>


"
" netrw (builtin file-browser plugin) preferences
"

" Default to tree view 
let g:netrw_liststyle = 3
" Hide common hidden files
let g:netrw_list_hide = '.*\.py[co]$,\.git$,\.swp$'
" Don't use frickin elinks, wtf
let g:netrw_http_cmd = "wget -q -O" " or 'curl -Ls -o'


"
" Custom "snippets"/shortcuts
"

" ReST header shortcuts: create or resize header formatting under/around
" current line.

function! NextLineIsOnly(char)
    let check_char = a:char
    if check_char == '~'
        let check_char = '\~'
    endif
    return getline(line(".")+1) =~ "^" . check_char . "\\+$"
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
nnoremap <expr> <F4> H("~")


" Git helper: take up to full length SHA1 under cursor and truncate to 7
" characters; plus a Redmine specific version to tack on "commit:"

function! TruncateToSevenChars()
    " Use viwo instead of b so it works even when cursor is on 1st char of word
    return "viwo7ld"
endf

function! FormatShaForCommit()
    return TruncateToSevenChars() . "bicommit:\<Esc>w"
endf

nnoremap <expr> <F7> FormatShaForCommit()


" Taken from an IBM DeveloperWorks article on Vim scripting -- prompts for
" creation of nonexistent directories.
augroup AutoMkdir
    autocmd!
    autocmd BufNewFile * :call EnsureDirExists()
augroup END
function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        call AskQuit("Directory '" . required_dir . "' doesn't exist.", "&Create it?")
        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'", "&Continue anyway?")
        endtry
    endif
endfunction

function! AskQuit (msg, proposed_action)
    if confirm(a:msg, a:proposed_action . "\n&Quit?") == 2
        exit
    endif
endfunction


" NERDTree
nmap <silent> <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '\.egg$']

" VimClojure
let g:vimclojure#ParenRainbow=1
let g:vimclojure#DynamicHighlighting=1

" Ctrl-P
let g:ctrlp_custom_ignore = '\.jar$|\.git$|/bin/.*|files/default/.*/lib$|\.gz$'
let g:ctrlp_clear_cache_on_exit = 0
