local vim = vim
local mark = require("harpoon.mark");
local ui = require("harpoon.ui");
-- local term = require("harpoon.term");
local tmux = require("harpoon.tmux");

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = 'Harpoon Mark' });
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'Harpoon Menu' });

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = 'Harpoon 1' });
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = 'Harpoon 2' });
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = 'Harpoon 3' });
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = 'Harpoon 4' });

vim.keymap.set("n", "<C-t>", function() ui.nav_prev() end, { desc = 'Harpoon Prev' });
vim.keymap.set("n", "<C-g>", function() ui.nav_next() end, { desc = 'Harpoon Next' });

vim.keymap.set("n", "<leader>5", function() tmux.gotoTerminal(1) end, { desc = 'Harpoon Term' });
