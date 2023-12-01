"Setting leader key
let mapleader = ","
let g:vscodevim_mapleader = ","

"============KEY BINDINGS=============
inoremap {<cr> {<cr>}<c-o><s-o
inoremap [<cr> [<cr>]<c-o><s-o
inoremap (<cr> (<cr>)<c-o><s-o
"Esc alias
inoremap <silent> <leader>jk <Esc>
"VISUAL BLOCK not working
nnoremap <leader>v <c-v>

nnoremap <leader>H ^
nnoremap <leader>L $

"scroll screen using j&k 
nnoremap J <c-e>
nnoremap K <c-y>