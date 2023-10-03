--To enable mode shapes, "Cursor" highlight, and blinking:
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- vim.cmd(':hi Cursor gui=NONE guifg=bg guibg=fg')

vim.opt.termguicolors = false
vim.opt.updatetime = 100
vim.scrolloff = 8
vim.cmd('set number')
vim.cmd('set relativenumber')
vim.cmd('set smartindent')
vim.cmd('set tabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('syntax enable')
vim.cmd('set cursorline')
vim.cmd('set foldmethod=indent')
vim.cmd('set matchpairs+=<:>')
vim.cmd('set ttyfast')
--vim.cmd('set colorcolumn=80')
--vim.cmd('highlight ColorColumn ctermbg=0 ctermfg=1 guibg=gray21')
vim.cmd('set path+=**') --find all the branches of directory

vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .."/.vim/undodir"
vim.opt.undofile = true

vim.g.mapleader = ","
vim.keymap.set("i","<leader>jk", '<Esc>')
vim.keymap.set("v","<leader>jk", '<Esc>')

vim.keymap.set("n","<C-z>", ':undo<CR>')
vim.keymap.set("n","<leader>v", '<C-v>')
vim.keymap.set("n","<leader>H", '^')
vim.keymap.set("n","<leader>L", '$')
vim.keymap.set("n","J", '<c-e>')
vim.keymap.set("n","K", '<c-y>')
-- vim.keymap.set("n","<c-a>", 'ggVG')
--vim.cmd [[autocmd VimEnter * set foldlevel=0 ]]
--vim.keymap.set("n","<leader>f",'zc')
--vim.keymap.set("n","<leader>F",'zo')

--Selected lines move up or down
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")

vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n","<C-c>", "\"+y")
vim.keymap.set("v","<C-c>", "\"+y")
vim.keymap.set("n","<C-c>", "\"+y")

vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument')
vim.cmd('command! -nargs=0 NoEng :setlocal spell spelllang=')
vim.cmd('command! -nargs=0 Eng :setlocal spell spelllang=en_us')

vim.keymap.set('n','N',':NvimTreeToggle<CR>')
-- vim.cmd("let g:indentLine_char = '┊'")
vim.cmd("let g:indentLine_char = '⋅'")

-- Mapped for testing lua plugins
vim.keymap.set("n","<leader>t",'<Plug>PlenaryTestFile')

-- <F2> --> Open neovim config
vim.keymap.set("n","<F2>",":e ~/.config/nvim/<CR>")

