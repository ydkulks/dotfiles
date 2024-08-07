local vim = vim

-- vim.opt.termguicolors = false
vim.opt.termguicolors = true
vim.opt.updatetime = 25
vim.opt.scrolloff = 5
vim.cmd('set number')
vim.cmd('set relativenumber')
vim.cmd('set smartindent')
vim.cmd('set tabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set expandtab')
vim.cmd('syntax enable')
vim.cmd('set cursorline')
vim.cmd('set foldmethod=indent')
-- vim.cmd('set foldmethod=expr')
-- vim.cmd('set foldexpr=nvim_tresitter#foldexpr()')
vim.cmd('set nofoldenable')
-- vim.cmd('set matchpairs+=<:>')
vim.cmd('set ttyfast')
--vim.cmd('set colorcolumn=80')
--vim.cmd('highlight ColorColumn ctermbg=0 ctermfg=1 guibg=gray21')
vim.cmd('set path+=**') --find all the branches of directory

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .."/.vim/undodir"
vim.opt.undofile = true

vim.g.mapleader = ","
vim.keymap.set("i","<leader>jk", '<Esc>')
vim.keymap.set("v","<leader>jk", '<Esc>')

vim.keymap.set("n","<C-z>", ':undo<CR>')
vim.keymap.set("n","<leader>H", '^')
vim.keymap.set("n","<leader>L", '$')
-- vim.keymap.set("n","J", 'J^')
-- vim.keymap.set("n","K", '')
vim.keymap.set("n","J", '<c-e>')
vim.keymap.set("n","K", '<c-y>')
vim.keymap.set("n","<leader>J", 'J^')
--vim.cmd [[autocmd VimEnter * set foldlevel=0 ]]

--Selected lines move up or down
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")

vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n","<C-c>", "\"+y")
vim.keymap.set("v","<C-c>", "\"+y")
vim.keymap.set("n","<C-c>", "\"+y")

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument')
vim.cmd('command! -nargs=0 Prettier :normal! ggVG=')
vim.cmd('command! -nargs=0 NoEng :setlocal spell spelllang=')
vim.cmd('command! -nargs=0 Eng :setlocal spell spelllang=en_us')

vim.keymap.set('n',"<leader>n",':NvimTreeToggle<CR>')
-- vim.cmd("let g:indentLine_char = '┊'")
vim.cmd("let g:indentLine_char = '⋅'")

-- Mapped for testing lua plugins
vim.keymap.set("n","<leader>t",'<Plug>PlenaryTestFile')

-- <F2> --> Open neovim config
vim.keymap.set("n","<F2>",":e ~/.config/nvim/<CR>")

-- Jump prev and next in Quick fix list
-- vim.keymap.set("n","<left>",":lprevious<CR>")
-- vim.keymap.set("n","<right>",":lnext<CR>")
-- vim.keymap.set("n","<up>",":cabove<CR>")
-- vim.keymap.set("n","<down>",":cbelow<CR>")

-- Diagnostic Keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- vim.keymap.set('n', '<leader>q', ":Telescope diagnostics<CR>", { desc = 'Press <C-q> to add it to quickfix list' })

-- Kemap that I reserver for testing new plugins
vim.keymap.set("n","<leader><Space>",":ASTToggle<CR>")
