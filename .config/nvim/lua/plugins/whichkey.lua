return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>?", function() require('which-key').show() end, { desc = 'Show which-key' })
    end
  },
}
