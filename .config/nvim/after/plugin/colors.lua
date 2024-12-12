require("tokyonight").setup {
  transparent = true,
  style = {
    sidebars = "transparent",
    floats = "transparent"
  },
  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights tokyonight.Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
}

function ColorMyPencils(color)
  vim.opt.termguicolors = false

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  if color == "palenight" then
    vim.api.nvim_set_hl(0, "Visual", { ctermbg = 238, italic = false, bold = true })
  elseif color == "tokyonight-storm" then
    vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "none" })
    vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none", fg = "#9ece6a" })
    -- vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "none", fg = "#e0af68" })
    vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "none", fg = "#545c7e" })
    vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = "none", fg = "#db4b4b" })
    -- vim.api.nvim_set_hl(0, "Visual", { bg = "#3c3836", italic = false, bold = true })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3b4261" })
  elseif color == "gruvbox" then
    vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "none" })
    vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = "none" })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#3c3836", italic = false, bold = true })
  end
end

-- ColorMyPencils("palenight")
-- ColorMyPencils("gruvbox")
ColorMyPencils("tokyonight-storm")
