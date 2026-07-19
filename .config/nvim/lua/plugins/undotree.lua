return {
  {
    'mbbill/undotree',
    event = "VeryLazy",
    opts = {},
    config = function()
      vim.keymap.set("n", "<leader>u", function() vim.cmd(':UndotreeToggle') end, { desc = "Undo Tree" })
    end
  },
}
