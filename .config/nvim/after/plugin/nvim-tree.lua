require "nvim-tree.api"
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	-- on_attach = my_on_attach(),
  renderer = {
    add_trailing = true,
  },
	view = {
		width = 30,
    side = "right",
	},
	filters = {
		dotfiles = true, -- hide dot files
	},
})
