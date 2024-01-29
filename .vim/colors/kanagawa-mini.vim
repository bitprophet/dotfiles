" Name:        Kanagawa-mini
" Description: A minimal color scheme ported from rebelot's kanagawa.nvim for Vim.
"              See also: https://github.com/rebelot/kanagawa.nvim
" Author:      leviosa42
" WebSite:     https://github.com/leviosa42/kanagawa-mini.vim
" License:     MIT license

if !exists('s:kanagawa_mini')
    let s:kanagawa_mini = {}
endif

function! s:kanagawa_mini.get_config(userconfig) abort " {{{
    let l:config = {}
    let l:config.undercurl = get(a:userconfig, 'undercurl', v:true)
    let l:config.commentStyle = get(a:userconfig, 'commentStyle', 'italic')
    let l:config.functionStyle = get(a:userconfig, 'functionStyle', 'NONE')
    let l:config.keywordStyle = get(a:userconfig, 'keywordStyle', 'italic')
    let l:config.statementStyle = get(a:userconfig, 'statementStyle', 'bold')
    let l:config.typeStyle = get(a:userconfig, 'typeStyle', 'NONE')
    " NOTE: The 'variablebuiltinStyle' option was originally for nvim-treesitter's '@variable.built-in'
    "       and is therefore not supported.
    let l:config.specialReturn = get(a:userconfig, 'specialReturn', v:true)
    let l:config.specialExeption = get(a:userconfig, 'specialExeption', v:true)
    let l:config.transparent = get(a:userconfig, 'transparent', v:false)
    " NOTE: The 'dimInactive' options was originally for nvim's 'NormalNC'
    "       highlight-group and is therefore not support.
    "       However, since WinSeparator(VertSplit) uses this option,
    "       the option itself is not removed for future use.
    let l:config.dimInactive = get(a:userconfig, 'dimInactive', v:false)
    " NOTE: It is unsupported because it is used to adjust the highlighting of the
    "       window separator with laststatus=3.
    let l:config.terminalColors = get(a:userconfig, 'terminalColors', v:true)
    " NOTE: The 'colors' option is not yet implemented.
    "let l:config.colors = get(a:userconfig, 'colors', {})
    " NOTE: The 'overrides' option is not yet implemented.
    "let l:config.overrides = get(a:userconfig, 'overrides', {})
    let l:config.theme = get(a:userconfig, 'theme', 'default')
    return l:config
endfunction " }}}

function! s:kanagawa_mini.get_palette(theme) abort " {{{
    let l:palettes  = {
        \ 'default': {
            \ 'sumiInk0'      : '#16161D',
            \ 'sumiInk1b'     : '#181820',
            \ 'sumiInk1c'     : '#1a1a22',
            \ 'sumiInk1'      : '#1F1F28',
            \ 'sumiInk2'      : '#2A2A37',
            \ 'sumiInk3'      : '#363646',
            \ 'sumiInk4'      : '#54546D',
            \ 'waveBlue1'     : '#223249',
            \ 'waveBlue2'     : '#2D4F67',
            \ 'winterGreen'   : '#2B3328',
            \ 'winterYellow'  : '#49443C',
            \ 'winterRed'     : '#43242B',
            \ 'winterBlue'    : '#252535',
            \ 'autumnGreen'   : '#76946A',
            \ 'autumnRed'     : '#C34043',
            \ 'autumnYellow'  : '#DCA561',
            \ 'samuraiRed'    : '#E82424',
            \ 'roninYellow'   : '#FF9E3B',
            \ 'waveAqua1'     : '#6A9589',
            \ 'dragonBlue'    : '#658594',
            \ 'oldWhite'      : '#C8C093',
            \ 'fujiWhite'     : '#DCD7BA',
            \ 'fujiGray'      : '#727169',
            \ 'springViolet1' : '#938AA9',
            \ 'oniViolet'     : '#957FB8',
            \ 'crystalBlue'   : '#7E9CD8',
            \ 'springViolet2' : '#9CABCA',
            \ 'springBlue'    : '#7FB4CA',
            \ 'lightBlue'     : '#A3D4D5',
            \ 'waveAqua2'     : '#7AA89F',
            \ 'springGreen'   : '#98BB6C',
            \ 'boatYellow1'   : '#938056',
            \ 'boatYellow2'   : '#C0A36E',
            \ 'carpYellow'    : '#E6C384',
            \ 'sakuraPink'    : '#D27E99',
            \ 'waveRed'       : '#E46876',
            \ 'peachRed'      : '#FF5D62',
            \ 'surimiOrange'  : '#FFA066',
            \ 'katanaGray'    : '#717C7C'
            \ }
        \ }
    return l:palettes[a:theme]
endfunction " }}}

function! s:kanagawa_mini.set_terminal_ansi_colors(palette) abort " {{{
    let g:terminal_ansi_colors = [
        \ '#090618',
        \ a:palette.autumnRed,
        \ a:palette.autumnGreen,
        \ a:palette.boatYellow2,
        \ a:palette.crystalBlue,
        \ a:palette.oniViolet,
        \ a:palette.waveAqua1,
        \ a:palette.oldWhite,
        \ a:palette.fujiGray,
        \ a:palette.samuraiRed,
        \ a:palette.springGreen,
        \ a:palette.carpYellow,
        \ a:palette.springBlue,
        \ a:palette.springViolet1,
        \ a:palette.waveAqua2,
        \ a:palette.fujiWhite,
        \ ]
    return
endfunction " }}}

function! s:kanagawa_mini.get_colors(palette) abort " {{{
    let l:colors = {
    \ 'bg' : a:palette.sumiInk1,
    \ 'bg_dim' : a:palette.sumiInk1b,
    \ 'bg_dark' : a:palette.sumiInk0,
    \ 'bg_light0' : a:palette.sumiInk2,
    \ 'bg_light1' : a:palette.sumiInk3,
    \ 'bg_light2' : a:palette.sumiInk4,
    \ 'bg_light3' : a:palette.springViolet1,
    \ 'bg_menu' : a:palette.waveBlue1,
    \ 'bg_menu_sel' : a:palette.waveBlue2,
    \ 'bg_status' : a:palette.sumiInk0,
    \ 'bg_visual' : a:palette.waveBlue1,
    \ 'bg_search' : a:palette.waveBlue2,
    \ 'fg_border' : a:palette.sumiInk4,
    \ 'fg_dark' : a:palette.oldWhite,
    \ 'fg_reverse' : a:palette.waveBlue1,
    \ 'fg_comment' : a:palette.fujiGray,
    \ 'fg' : a:palette.fujiWhite,
    \ 'fg_menu' : a:palette.fujiWhite,
    \ 'co' : a:palette.surimiOrange,
    \ 'st' : a:palette.springGreen,
    \ 'nu' : a:palette.sakuraPink,
    \ 'id' : a:palette.carpYellow,
    \ 'fn' : a:palette.crystalBlue,
    \ 'sm' : a:palette.oniViolet,
    \ 'kw' : a:palette.oniViolet,
    \ 'op' : a:palette.boatYellow2,
    \ 'pp' : a:palette.surimiOrange,
    \ 'ty' : a:palette.waveAqua2,
    \ 'sp' : a:palette.springBlue,
    \ 'sp2' : a:palette.waveRed,
    \ 'sp3' : a:palette.peachRed,
    \ 'br' : a:palette.springViolet2,
    \ 're' : a:palette.boatYellow2,
    \ 'dep' : a:palette.katanaGray,
    \ 'diag' : {
        \ 'error' : a:palette.samuraiRed,
        \ 'warning' : a:palette.roninYellow,
        \ 'info' : a:palette.dragonBlue,
        \ 'hint' : a:palette.waveAqua1,
        \ },
    \ 'diff' : {
        \ 'add' : a:palette.winterGreen,
        \ 'delete' : a:palette.winterRed,
        \ 'change' : a:palette.winterBlue,
        \ 'text' : a:palette.winterYellow,
        \ },
    \ 'git' : {
        \ 'added' : a:palette.autumnGreen,
        \ 'removed' : a:palette.autumnRed,
        \ 'changed' : a:palette.autumnYellow,
        \ },
    \ }
    return l:colors
endfunction " }}}

function! s:kanagawa_mini.h(group, style) abort " {{{
    if empty(a:style)
        return
    endif
    if has_key(a:style, 'link')
        execute 'hi!' 'link' a:group a:style.link
        return
    endif
    execute 'hi' a:group
    \ 'guibg=' . (has_key(a:style, 'bg')  ? a:style.bg  : 'NONE')
    \ 'guifg=' . (has_key(a:style, 'fg')  ? a:style.fg  : 'NONE')
    \ 'guisp=' . (has_key(a:style, 'sp')  ? a:style.sp  : 'NONE')
    \ 'gui='   . (has_key(a:style, 'gui')
        \ ? a:style.gui == 'undercurl'
            \ ? self.config.undercurl ? 'undercurl' : 'NONE'
            \ : a:style.gui
        \ : 'NONE')
endfunction " }}}

function! s:kanagawa_mini.hlgroups(colors, config) abort " {{{
    "let has_nvim = has('nvim')
    call self.h('ColorColumn', { 'bg': a:colors.bg_light0 })
    call self.h('Conceal', { 'fg': a:colors.bg_light3, 'gui': 'bold' })
    call self.h('Cursor', { 'fg': a:colors.bg, 'bg': a:colors.fg })
    call self.h('lCursor', { 'link': 'Cursor' })
    call self.h('CursorIM', { 'link': 'Cursor' })
    call self.h('CursorLine', { 'bg': a:colors.bg_light1 })
    call self.h('Directory', { 'fg': a:colors.fn })
    call self.h('DiffAdd', { 'bg': a:colors.diff.add })
    call self.h('DiffChange', { 'bg': a:colors.diff.change })
    call self.h('DiffDelete', { 'fg': a:colors.git.removed, 'bg': a:colors.diff.delete })
    call self.h('DiffText', { 'bg': a:colors.diff.text })
    call self.h('EndOfBuffer', { 'fg': a:colors.bg })
    "if self.has_nvim | call l:h('TermCursor', {}) | endif
    "if self.has_nvim | call l:h('TermCursor', {}) | endif
    call self.h('ErrorMsg', { 'fg': a:colors.diag.error })
    " NOTE:
    " httpl://github.com/rebelot/kanagawa.nvim/blob/4c8d48726621a7f3998c7ed35b2c2535abc22def/lua/kanagawa/hlgroups.lua#L50
    call self.h('VertSplit', { 'fg': a:colors.bg_dark, 'bg': a:config.dimInactive ? a:colors.bg_dark : 'NONE' })
    call self.h('Folded', { 'fg': a:colors.bg_light3, 'bg': a:colors.bg_light0 })
    call self.h('FoldColumn', { 'fg': a:colors.bg_light2 })
    call self.h('SignColumn', { 'fg': a:colors.bg_light2 })
    " TODO: I couldn't find any docs on this highlight group...
    " call self.h('SignColumnSB', { 'link': 'SignColumn' })
    "if self.has_nvim | call l:h('Substitute', { 'fg': a:colors.fg, 'bg': a:colors.git.removed }) | endif
    call self.h('LineNr', { 'fg': a:colors.bg_light2 })
    call self.h('CursorLineNr', { 'fg': a:colors.diag.warning, 'gui': 'bold' })
    call self.h('MatchParen', { 'fg': a:colors.diag.warning, 'gui': 'bold' })
    call self.h('ModeMsg', { 'fg': a:colors.diag.warning, 'gui': 'bold'})
    "if self.has_nvim | call l:h('MsgArea', { 'fg': a:colors.fg_dark }) | endif
    " nvim:MsgSeparator
    call self.h('MoreMsg', { 'fg': a:colors.diag.info, 'bg': a:colors.bg })
    call self.h('NonText', { 'fg': a:colors.bg_light2 })
    call self.h('Normal', { 'fg': a:colors.fg, 'bg': !a:config.transparent ? a:colors.bg : 'NONE' })
    "if self.has_nvim | call l:h('NormalNC', a:config.dimInactive ? { 'fg': a:colors.fg_dark, 'bg': a:colors.bg_dim } : { 'link': 'Normal' }) | endif
    "if self.has_nvim | call l:h('NormalSB', { 'link': 'Normal' }) | endif
    "if self.has_nvim | call l:h('NormalFloat', { 'fg': a:colors.fg_dark, 'bg': a:colors.bg_dark }) | endif
    "if self.has_nvim | call l:h('FloatBorder', { 'fg': a:colors.fg_border, 'bg': a:colors.bg_dark }) | endif
    "if self.has_nvim | call l:h('FloatTitle', { 'fg': a:colors.bg_light3, 'bg': a:colors.bg_dark, 'gui': 'bold' }) | endif
    call self.h('Pmenu', { 'fg': a:colors.fg_menu, 'bg': a:colors.bg_menu })
    call self.h('PmenuSel', { 'fg': 'NONE', 'bg': a:colors.bg_menu_sel })
    call self.h('PmenuSbar', { 'link': 'Pmenu' })
    call self.h('PmenuThumb', { 'bg': a:colors.bg_search })
    call self.h('Question', { 'link': 'MoreMsg' })
    call self.h('QuickFixLine', { 'link': 'CursorLine' })
    call self.h('Search', { 'fg': a:colors.fg, 'bg': a:colors.bg_search })
    "if self.has_nvim | call l:h('CurSearch', { 'link': 'Search' }) | endif
    call self.h('IncSearch', { 'fg': a:colors.bg_visual, 'bg': a:colors.diag.warning })
    call self.h('SpecialKey', { 'link': 'NonText' })
    call self.h('SpellBad', { 'sp': a:colors.diag.error, 'gui': 'undercurl' })
    call self.h('SpellCap', { 'sp': a:colors.diag.warning, 'gui': 'undercurl' })
    call self.h('SpellLocal', { 'sp': a:colors.diag.warning, 'gui': 'undercurl' })
    call self.h('SpellRare', { 'sp': a:colors.diag.warning, 'gui': 'undercurl' })
    call self.h('StatusLine', { 'fg': a:colors.fg_dark, 'bg': a:colors.bg_status })
    call self.h('StatusLineNC', { 'fg': a:colors.fg_comment, 'bg': a:colors.bg_status })
    "if self.has_nvim | call l:h('Winbar', { 'fg': a:colors.fg_dark, 'bg': 'NONE' }) | endif
    "if self.has_nvim | call l:h('WinbarNC', { 'fg': a:colors.fg_dark, 'bg': a:config.dimInactive ? a:colors.bg_dim : 'NONE' }) | endif
    call self.h('TabLine', { 'bg': a:colors.bg_dark, 'fg': a:colors.bg_light3 })
    call self.h('TabLineFill', { 'bg': a:colors.bg })
    call self.h('TabLineSel', { 'fg': a:colors.fg_dark, 'bg': a:colors.bg_light1 })
    call self.h('Title', { 'fg': a:colors.fn, 'gui': 'bold' })
    call self.h('Visual', { 'bg': a:colors.bg_visual })
    call self.h('VisualNOS', { 'link': 'Visual' })
    call self.h('WarningMsg', { 'fg': a:colors.diag.warning })
    "if self.has_nvim | call l:h('Whitespace', { 'fg': a:colors.bg_light2 }) | endif
    call self.h('WildMenu', { 'link': 'Pmenu' })

    call self.h('Comment', { 'fg': a:colors.fg_comment })

    call self.h('Constant', { 'fg': a:colors.co })
    call self.h('String', { 'fg': a:colors.st })
    call self.h('Character', { 'link': 'String' })
    call self.h('Number', { 'fg': a:colors.nu })
    call self.h('Boolean', { 'fg': a:colors.co, 'gui': 'bold' })
    call self.h('Float', { 'link': 'Number' })

    call self.h('Identifier', { 'fg': a:colors.id })
    call self.h('Function', { 'fg': a:colors.fn, 'gui': a:config.functionStyle })

    call self.h('Statement', { 'fg': a:colors.sm, 'gui': a:config.statementStyle })
    " Conditional
    " Repeat
    " Label
    call self.h('Operator', { 'fg': a:colors.op })
    call self.h('Keyword', { 'fg': a:colors.kw, 'gui': a:config.keywordStyle })
    call self.h('Exception', { 'fg': a:colors.sp2 })

    call self.h('PreProc', { 'fg': a:colors.pp })
    " Include
    " Define
    " Precondit

    call self.h('Type', { 'fg': a:colors.ty, 'gui': a:config.typeStyle })
    " StorageClass
    " Structure
    " Typedef

    call self.h('Special', { 'fg': a:colors.sp })
    " SpecialChar
    " Tag
    " Delimiter
    " SpecialComment
    " Debug

    call self.h('Underlined', { 'fg': a:colors.sp, 'gui': 'underline' })

    call self.h('Ignore', { 'link': 'NonText' })

    call self.h('Error', { 'fg': a:colors.diag.error })

    call self.h('ToDo', { 'fg': a:colors.fg_reverse, 'bg': a:colors.diag.info, 'gui': 'bold' })

    "call self.h('Method', { 'link': 'Function' })
    "call self.h('Structure', { 'link': 'Type' })
    "call self.h('Bold', { 'gui': 'bold' })
    "call self.h('Italic', { 'gui': 'italic' })
endfunction " }}}

let g:colors_name = expand('<sfile>:t:r')

set bg=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let s:kanagawa_mini.config = s:kanagawa_mini.get_config(get(g:, 'kanagawa_mini', {}))

if !exists('g:kanagawa_mini')
    let g:kanagawa_mini = s:kanagawa_mini.config
endif

let s:kanagawa_mini.palette = s:kanagawa_mini.get_palette(s:kanagawa_mini.config.theme)

if s:kanagawa_mini.config.terminalColors
    call s:kanagawa_mini.set_terminal_ansi_colors(s:kanagawa_mini.palette)
endif

let s:kanagawa_mini.colors = s:kanagawa_mini.get_colors(s:kanagawa_mini.palette)

call s:kanagawa_mini.hlgroups(s:kanagawa_mini.colors, s:kanagawa_mini.config)

" vim: fenc=utf-8 ff=unix ft=vim ts=4 sw=4 sts=4 si et fdm=marker fmr={{{,}}}:
