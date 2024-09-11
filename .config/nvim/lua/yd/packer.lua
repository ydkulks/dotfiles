-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({ function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'drewtempelmeyer/palenight.vim'
  -- use 'ellisonleao/gruvbox.nvim'
  use 'folke/tokyonight.nvim'
  -- Post-install/update hook with neovim command
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- use { 'nvim-treesitter/playground' }
  use { 'nvim-telescope/telescope-symbols.nvim' }
  use { 'tpope/vim-fugitive' }
  use 'christoomey/vim-tmux-navigator'
  use 'airblade/vim-gitgutter'
  use 'dsznajder/vscode-es7-javascript-react-snippets'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'
  use 'Yggdroot/indentLine'
  use 'tpope/vim-commentary'
  use 'mbbill/undotree'
  use 'ThePrimeagen/harpoon'
  use {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {}
    end
  }
  -- use 'ThePrimeagen/vim-be-good'

  -- My plugins
  -- use 'ydkulks/speedster.nvim'
  -- use '/home/yd/Projects/luaPlugins/conceal.nvim'
  use '/home/yd/Projects/luaPlugins/AST.nvim'

  -- use {
  --   "ydkulks/AST.nvim",
  --   requires = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-lua/plenary.nvim"
  --   },
  --   config = function()
  --     require("AST")
  --   end
  -- }

  -- Debugger
  -- use 'mfussenegger/nvim-dap'
  -- use 'rcarriga/nvim-dap-ui'
  -- use 'leoluz/nvim-dap-go'

  -- Startup page
  use {
    "ydkulks/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "startup".setup()
    end
  }

  -- Comment Utility
  use {
    "folke/todo-comments.nvim",
    require = { "nvim-lua/plenary.nvim" }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },                  -- Required
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'L3MON4D3/LuaSnip' }, -- Required
    }
  }

  -- AI
  -- Install ollama: curl -fsSL https://ollama.com/install.sh | sh
  -- Run (cmd): ollama run llama3.1 'Test prompt'(ollama run model 'prompt')
  use "David-Kunz/gen.nvim"
end,
})
