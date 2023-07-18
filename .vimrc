"================VIM-PLUG==============
set encoding=UTF-8
filetype off
let g:coc_disable_startup_warning = 1
call plug#begin()
"
""Plugin for displaying directories
Plug 'preservim/nerdtree'
""Plugin for commenting
Plug 'preservim/nerdcommenter'

""Plugin for Prettier
Plug 'prettier/vim-prettier',{'branch':'release/0.x'}

""Colorscheme 
"Bundle 'bzx/vim-theme-pack'
"Plug 'dracula/vim',{'as':'dracula'}
Plug 'drewtempelmeyer/palenight.vim'

""Coc autocompletion 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""Vim-tmux
Plug 'christoomey/vim-tmux-navigator'

""Dev icons
Plug 'ryanoasis/vim-devicons'

""Indent line
Plug 'Yggdroot/indentLine'

""Git diff marks
Plug 'airblade/vim-gitgutter'

""React snippets
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }

""JSX & TSX syntax highlight
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()            " required
filetype plugin indent on    " required
filetype plugin on          "required for COC

""Coc config for snippets
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-emmet',
    \]
"Mapping selectConfirm() to Tab to select emmet
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : coc#_select_confirm()
inoremap <silent><expr> <Tab> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"

""Prettier config
"nnoremap <leader>p :Prettier
let g:prettier#autoformat=1
let g:prettier#autoformat_require_pragma=0

"" NerdTree config to show .dot files
let NERDTreeShowHidden=1

""Indent Line config
"let g:indentLine_enable = 1
"let g:indentLine_char = '┊'

""JSX & TSX syntax highlight
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

 "==============CUSTOM SETTINGS===========
 set number
 set relativenumber  
 set background=dark
 "colors murphy
 "colors low
 "colors molokai
 "colorscheme dracula
 colorscheme palenight
 set showcmd
 set smartindent
 set tabstop=2
 set shiftwidth=2
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
 "for folding/hiding lines of code/text
 set foldmethod=indent

 " Highlight matching pairs of brackets. Use the '%' character to jump
 "between them.
 set matchpairs+=<:>
 set ttyfast
 "set listchars=tab:\|\ 
 "set list
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
 inoremap <leader>jk <esc>
"VISUAL BLOCK not working
 nnoremap <leader>v <c-v>
 "puts the word in double-quotes
 nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
 nnoremap <leader>H ^
 nnoremap <leader>L $
 "if foldmethod=manual, select lines in VISUAL mode and fold/hide it
 "Go to ~/.vim/view/ to see views created by :mkview
 "To load the view :loadview
""Default to open all folds
au BufRead * normal zR
nnoremap <leader>f za
nnoremap <leader>FF zR
nnoremap <leader>F zM
"vnoremap <leader>f zf

"scroll screen using j&k 
nnoremap J <c-e>
nnoremap K <c-y>

"Toggle nerdtree 
nnoremap N :NERDTreeToggle<enter>

"80 character column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

 ""scrolling with mouse
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
