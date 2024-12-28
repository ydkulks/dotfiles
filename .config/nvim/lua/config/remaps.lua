vim.g.mapleader = " "
-- vim.g.mapleader = ","
-- vim.keymap.set("i", "<leader>jk", '<Esc>', { desc = "Normal Mode" })
-- vim.keymap.set("v", "<leader>jk", '<Esc>', { desc = "Normal Mode" })
vim.keymap.set("i", "<leader>kj", '<Esc>', { desc = "Normal Mode" })
vim.keymap.set("v", "<leader>kj", '<Esc>', { desc = "Normal Mode" })

-- vim.keymap.set("n", "<C-z>", ':undo<CR>')
vim.keymap.set("n", "<leader>H", '^', { desc = "Go to beginning of line" })
vim.keymap.set("n", "<leader>L", '$', { desc = "Go to end of line" })
-- vim.keymap.set("n","J", 'J^')
-- vim.keymap.set("n","K", '')
vim.keymap.set("n", "J", '<c-e>', { desc = "Scroll down" })
vim.keymap.set("n", "K", '<c-y>', { desc = "Scroll up" })
vim.keymap.set("n", "<leader>J", 'J^', { desc = "Append next line to current line" })
--vim.cmd [[autocmd VimEnter * set foldlevel=0 ]]

--Selected lines move up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })

-- vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<C-c>", "\"+y", { desc = 'Yank to Global clipboard' })
vim.keymap.set("v", "<C-c>", "\"+y", { desc = 'Yank to Global clipboard' })
vim.keymap.set("n", "<C-c>", "\"+y", { desc = 'Yank to Global clipboard' })

-- Mapped for testing lua plugins
vim.keymap.set("n", "<leader>T", '<Plug>PlenaryTestFile', { desc = "Plenary Run Test" })

-- vim.keymap.set('n', "<leader>n", ':Oil<CR>', { desc = "Oil" })

-- Git gutter hunk Jump
-- vim.keymap.set("n", "<up>", ":GitGutterPrevHunk<CR>", { desc = 'Previous Hunk' })
-- vim.keymap.set("n", "<down>", ":GitGutterNextHunk<CR>", { desc = 'Next Hunk' })

-- Kemap that I reserver for testing new plugins
-- vim.keymap.set("n","<leader><Space>",":ASTToggle<CR>")

-- vim.keymap.set("n", "<leader>?", ":WhichKey<CR>", { desc = 'Show which-key' })

-- Open terminal in Neovim
vim.keymap.set("n", "<leader>t", ":Floaterminal<CR>", { desc = 'Neovim terminal' })
