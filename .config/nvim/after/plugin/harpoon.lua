local vim = vim
local mark = require("harpoon.mark");
local ui = require("harpoon.ui");
-- local term = require("harpoon.term");
local tmux = require("harpoon.tmux");

vim.keymap.set("n", "<leader>a", mark.add_file);
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu);

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end);
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end);
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end);
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end);

vim.keymap.set("n", "<C-t>", function() ui.nav_prev() end);
vim.keymap.set("n", "<C-g>", function() ui.nav_next() end);

vim.keymap.set("n", "<leader>5", function() tmux.gotoTerminal(1) end);
