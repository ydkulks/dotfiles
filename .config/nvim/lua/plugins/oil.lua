return {
  {
    "stevearc/oil.nvim",
    opts = {},
    event = "VeryLazy",
    dependencies = {
      -- { "echasnovski/mini.icons", opts = {} },
      { "nvim-tree/nvim-web-devicons", opts = {} },
    },
    config = function()
      require('oil').setup {
        watch_for_changes = true,
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
        },
        vim.keymap.set("n", "<leader>n", function() require('oil').open() end, { desc = "Oil" }),
        vim.keymap.set("n", "<leader>N", function() require('oil').open(vim.fn.getcwd()) end, { desc = "Oil PWD" }),
      }
    end
  }
}
