require("yd")
vim.cmd('autocmd BufRead,BufWinEnter * normal! zR')
--vim.cmd('highlight ColorColumn ctermbg=0 ctermfg=1')
vim.cmd(':highlight Cursor guibg=gray ctermbg=black')
vim.cmd[[
augroup TxtSpell
  autocmd!
	autocmd BufRead *.txt setlocal spell spelllang=en_us
augroup END
]]
--print('Hello from init.lua')
