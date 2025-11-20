return {
  {
    -- "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme('tokyonight-storm')
    --   require("tokyonight").setup {
    --     transparent = true,

    --     -- NOTE: Colorscheme: Gitgutter and floatborder color
    --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" }),
    --     vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }),
    --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }),
    --     vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#3b4261" }),
    --     vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" }),
    --     vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" }),

    --     vim.api.nvim_set_hl(0, "SignColumn", { ctermbg = "none" }),
    --     vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none", fg = "#9ece6a" }),
    --     -- vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none", fg = "#e0af68" }),
    --     vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none", fg = "#545c7e" }),
    --     vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none", fg = "#db4b4b" }),
    --     -- vim.api.nvim_set_hl(0, "Visual", { bg = "#3c3836", italic = false, bold = true }),

    --   }
    -- end

    "ydkulks/cursor-dark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("cursor-dark")
      require("cursor-dark").setup({
        style = "dark-midnight",
        -- style = "dark",
        transparent = true,
        dashboard = true
      })
    end

  },
}
