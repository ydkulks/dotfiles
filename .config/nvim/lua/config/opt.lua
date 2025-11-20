vim.opt.termguicolors = true
vim.opt.updatetime = 25
vim.opt.scrolloff = 10
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
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.signcolumn = "auto" -- [1 to 9] or auto or auto:[1 to 9]

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '⋅ ', trail = '·', nbsp = '␣' }

-- vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument')
vim.cmd('command! -nargs=0 Prettier :normal! ggVG=')
vim.cmd('command! -nargs=0 NoEng :setlocal spell spelllang=')
vim.cmd('command! -nargs=0 Eng :setlocal spell spelllang=en_us')

-- vim.cmd("let g:indentLine_char = '┊'")
vim.cmd("let g:indentLine_char = '⋅'")

-- Blinking cursor
vim.cmd('set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor')
vim.cmd('set guicursor+=a:blinkwait700-blinkoff400-blinkon250')

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
