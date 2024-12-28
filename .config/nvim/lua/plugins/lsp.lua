return {
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "VeryLazy",
    branchs = "V4.X",
    dependencies = {
      { 'williamboman/mason.nvim',           opts = {} },
      { 'williamboman/mason-lspconfig.nvim', opts = {} },
      -- { 'hrsh7th/nvim-cmp',                  opts = {}, event = "InsertEnter" },
      { 'windwp/nvim-autopairs',             opts = {} },
      { "neovim/nvim-lspconfig",             tags = "v1.2.*", opts = {} },
    },
    config = function()
      -- NOTE: LSP keymaps
      local lsp = require('lsp-zero')
      lsp.on_attach(function(_, bufnr)
        local function opts(descValue)
          return { buffer = bufnr, remap = false, desc = descValue }
        end

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts("Go to definition"))
        vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts("Hover"))
        vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts("Go to References"))
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("Rename"))
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format()
        end, opts("Format"))
        -- vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts("Signature Help"))
        vim.keymap.set("n", "<left>", function() vim.diagnostic.goto_prev() end, opts("Prev diagnostic"))
        vim.keymap.set("n", "<right>", function() vim.diagnostic.goto_next() end, opts("Next diagnostic"))
      end)

      -- NOTE: Language Servers
      require('mason').setup({})
      require('mason-lspconfig').setup {
        automatic_installation = true,
        -- automatic_installation = { exclude = { 'asm_lsp' } }, -- Did not work
        ensure_installed = {
          'ts_ls', 'html', 'cssls', 'jsonls', 'emmet_ls', 'lua_ls', 'gopls', 'tailwindcss', 'htmx', -- curl https://sh.rustup.rs -sSf | sh
          'biome',
          -- 'asm_lsp',
        },
      }

      -- require('lspconfig').html.setup{}
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end
      })

      -- NOTE: Custom Border and DiagnosticSign
      -- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      -- Configure appearance of diagnostic signs
      local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end
  },

  -- NOTE: Completion
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      -- { 'mlaursen/vim-react-snippets' },
      {
        "saghen/blink.cmp",
        -- tags = 'v0.8.*',
        version = "v0.8.2", -- Releases has prebuilt binaries for fuzzy finding
        opts = {
          keymap = {
            preset = 'default',
            ['<C-n>'] = { 'select_next' },
            ['<C-p'] = { 'select_prev' },
            ['C-b'] = { 'scroll_documentation_up' },
            ['C-f'] = { 'scroll_documentation_down' },
          },

          completion = {
            accept = { auto_brackets = { enabled = true } },
            ghost_text = { enabled = true },
            -- menu = { border = 'rounded' },
            documentation = { window = { border = 'rounded' } }
          },

          signature = {
            enabled = true,
            window = { border = 'rounded' }
          },

        },
        opts_extend = { "sources.default" }
      },
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          }
        }
      },
    },
    config = function()
      require("lspconfig").lua_ls.setup {}

      local capabilities = require('blink.cmp').get_lsp
      if capabilities ~= nil then -- Some buffers might not have lsp
        require("lspconfig").lua_ls.setup { capabilities = capabilities.capabilities() }
      end
      -- require("vim-react-snippets").lazy_load()
    end
  },
}
