"================VUNDLE PLUGIN MANAGER==============
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin for autocomplete by vim
Plugin 'vim-scripts/AutoComplPop'
"Plugin for displaying directories
Plugin 'preservim/nerdtree'
"Prettier plugin for file formatting (usage--> :Prettier)
Plugin 'prettier/vim-prettier'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"==============CUSTOM SETTINGS===========
set number
set relativenumber  
"prints out characters in terminal before opening Vim
"echo '(>^.^<)'
"echo ' [¬º-°]¬'
"echo '(~‾°‾)~'
"echo 'ʕ•ᴥ•ʔ'
colors darkblue
colors low
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set complete+=kspell
set autoindent
set linebreak
syntax enable
set laststatus=2
set cursorline
set title
set spell
set cursorline
set completeopt+=menuone,longest
" Highlight matching pairs of brackets. Use the '%' character to jump between
" them.
set matchpairs+=<:>
set ttyfast
"Setting leader key
let mapleader = ","

"============KEY BINDINGS=============
inoremap {<cr> {<cr>}<c-o><s-o
inoremap [<cr> [<cr>]<c-o><s-o
inoremap (<cr> (<cr>)<c-o><s-o
"up arrow key will move current line upward
nnoremap <up> ddkP   
"down arrow key will move cursor line downward
nnoremap <down> ddp 
"Undo
nnoremap <c-z> <esc>:undo<enter>
"Esc alias
""inoremap <leader><tab> <esc>  
inoremap <leader>jk <esc>
"Open vertical terminal
nnoremap <leader>v :vert term <enter>
"Opens current file in vertical screen
nnoremap <leader>ev :vsplit <enter>
""nnoremap <leader>sv :source $MYVIMRC<cr>
"puts the word in double-quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>H ^
nnoremap <leader>L $
