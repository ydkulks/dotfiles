local builtin = require('telescope.builtin')
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules/*", ".git/*" },
    hidden = true,
    wrap_results = true,
  },
}
vim.keymap.set('n', '<leader>P', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git files" })
vim.keymap.set('n', '<F2>', function()
  builtin.git_files {
    cwd = vim.fn.stdpath("config")
  }
end, { desc = "Config Git" })
vim.keymap.set('n', '<leader>s', builtin.live_grep, { desc = "Live grep" })
