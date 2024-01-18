local vim = vim
function ColorMyPencils(color)
	color = "palenight"
	-- color = "onedark"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0,"Normal", {bg = "none"})
	-- vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})
  vim.api.nvim_set_hl(0,"Visual", { ctermbg = "blue", ctermfg = "black"})
  -- vim.api.nvim_exec([[
  -- hi Visual cterm=bold gui=bold
  -- ]],false)
end

ColorMyPencils()
