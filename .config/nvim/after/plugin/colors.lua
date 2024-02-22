local vim = vim
function ColorMyPencils(color)
  vim.opt.termguicolors = false

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  if color == "palenight" then
    vim.api.nvim_set_hl(0, "Visual", { ctermbg = 238, italic = false, bold = true })
  elseif color == "gruvbox" then
    vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "none" })
    -- vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = "none" })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#3c3836", italic = false, bold = true })
  end

end

ColorMyPencils("palenight")
-- ColorMyPencils("gruvbox")
