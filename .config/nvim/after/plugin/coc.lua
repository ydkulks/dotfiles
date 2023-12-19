vim.keymap.set('n','<leader>r', '<Plug>(coc-references-used)')
vim.keymap.set('n','<leader>gd', '<Plug>(coc-definition)')
vim.keymap.set('n','<leader>rn', '<Plug>(coc-rename)')

vim.cmd('set signcolumn=yes')
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- Map <Tab> in insert mode
vim.keymap.set('i', '<Tab>',
 [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], 
 opts
)
