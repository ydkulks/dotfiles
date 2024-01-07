require("nvim-tree").setup({
	sort_by = "case_sensitive",
	on_attach = my_on_attach,
	view = {
		width = 30,
    side = "right",
	},
	filters = {
		dotfiles = true,
	},
})

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"
	vim.keymap.set('n','N',':NvimTreeOpen<CR>')
end
