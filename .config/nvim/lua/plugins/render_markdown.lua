return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = "markdown",
    event = "VeryLazy",
    after = { 'nvim-treesitter' },
    -- dependencies = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },   -- if you use standalone mini plugins
    opts = {},
  },
}
