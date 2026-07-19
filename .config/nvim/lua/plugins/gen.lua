return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_word = "<leader><Tab>",
        },
        ignore_filetypes = { "txt", "json", ".env", ".gitignore", "markdown" },
        log_level = "off", -- set to "off" to disable logging completely
      })
    end
  }
}
