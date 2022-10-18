set nomodeline
set number relativenumber
set ruler

execute pathogen#infect()
filetype indent plugin on
syntax on

set expandtab shiftwidth=2 tabstop=2
set textwidth=80

" trim whitespace on write
autocmd BufWritePost ?* %s@\s\+$@@e

" per filetype settings
autocmd filetype html,xml set spell spelllang=en_gb
