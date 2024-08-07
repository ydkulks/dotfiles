local builtin = require('telescope.builtin')
require('telescope').setup{
	defaults = {
		file_ignore_patterns = {"node_modules/*",".git/*"},
		hidden = true,
		wrap_results = true,
	},
}
vim.keymap.set('n', '<leader>P', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
