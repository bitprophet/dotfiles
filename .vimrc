" Stuff that needs to come before plugins for w/e reason
source ~/.vim/rc/before-plugins
" vim-plug plugins list & plugin settings
source ~/.vim/rc/plugins
" Basic settings/behavior toggles/etc
source ~/.vim/rc/settings
" MacVim specific settings (conditionally loaded internally)
source ~/.vim/rc/macvim
" Filetype-specific tweaks (and path-specific filetype-setting)
source ~/.vim/rc/filetypes
" Global key mappings, functions, leader shortcuts, etc
source ~/.vim/rc/mappings
" vimwiki gets its own file
source ~/.vim/rc/vimwiki
" (semi-)sensitive / PII-exposing vimrc commands.
" NOTE: Not version-controlled.
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
