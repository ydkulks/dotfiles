local vim = vim
function ColorMyPencils(color)
  color = "palenight"
  -- color = "gruvbox"

  if color == "palenight" then
    vim.opt.termguicolors = false
    -- vim.api.nvim_set_hl(0,"Visual", { ctermbg=238, italic=false, bold=true })
  end

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "Visual", { ctermbg = 238, italic = false, bold = true })
end

ColorMyPencils()
