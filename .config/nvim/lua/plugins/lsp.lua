return {
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "VeryLazy", -- ColorScheme, FileType
    branchs = "v4.x",
    dependencies = {
      { 'williamboman/mason.nvim',           opts = {} },
      { 'williamboman/mason-lspconfig.nvim', opts = {} },
      -- { 'hrsh7th/nvim-cmp',                  opts = {}, event = "InsertEnter" },
      { 'windwp/nvim-autopairs',             opts = {} },
      { 'mfussenegger/nvim-jdtls' },
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
        vim.keymap.set("n", "<left>", function() vim.diagnostic.jump({ count = -1, float = true }) end,
          opts("Prev diagnostic"))
        vim.keymap.set("n", "<right>", function() vim.diagnostic.jump({ count = 1, float = true }) end,
          opts("Next diagnostic"))
      end)

      -- NOTE: Language Servers
      local servers = {
        'ts_ls', 'html', 'cssls', 'emmet_ls', 'lua_ls', 'gopls', 'tailwindcss',
        -- 'htmx', -- curl https://sh.rustup.rs -sSf | sh
        -- 'jsonls',
        'jdtls',            -- Java
        'pyright', 'pylsp', -- Python
        -- 'asm_lsp',
      }
      require('mason').setup({})
      require('mason-lspconfig').setup {
        automatic_installation = true,
        -- automatic_installation = { exclude = { 'asm_lsp' } }, -- Did not work
        automatic_enable = servers,
        ensure_installed = servers,
      }

      -- NOTE: New way of setting up lsp servers
      -- vim.lsp.config('server', {})
      for _, value in ipairs(servers) do
        vim.lsp.config(value, {})
      end

      -- NOTE: Custom Border and DiagnosticSign
      vim.diagnostic.config({
        float = {
          border = "rounded"
        }
      })
      -- vim.o.winborder = "rounded" -- too powerful
      -- vim.lsp.buf.hover({ border = "rounded" })
      -- vim.lsp.buf.signature_help({ border = "rounded" })
      ---@diagnostic disable: duplicate-set-field
      local _original_hover = vim.lsp.buf.hover
      vim.lsp.buf.hover = function(opts)
        opts = opts or {}
        opts.border = opts.border or "rounded" -- Set default if not already specified
        return _original_hover(opts)
      end

      ---@diagnostic disable: duplicate-set-field
      local _original_signature_help = vim.lsp.buf.signature_help
      vim.lsp.buf.signature_help = function(opts)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return _original_signature_help(opts)
      end

      -- Configure appearance of diagnostic signs
      -- local signsIcons = { Error = " ", Warning = " ", Hint = " ", Information = " " }
      local signsIcons = { Error = " ", Warning = " ", Hint = " ", Information = " " }
      vim.diagnostic.config({
        virtual_text = {
          current_line = true,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = signsIcons.Error,
            [vim.diagnostic.severity.WARN] = signsIcons.Warning,
            [vim.diagnostic.severity.HINT] = signsIcons.Hint,
            [vim.diagnostic.severity.INFO] = signsIcons.Information,
          }
        },
        severity_sort = true,
      })
    end
  },

  -- NOTE: Completion
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      -- { 'ydkulks/friendly-snippets' },
      {
        -- NOTE: DB Connection URL is at g:db_ui_save_location or ~/.local/share/db_ui/connections.json
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
          { 'tpope/vim-dadbod',                     lazy = true },
          { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
          'DBUI',
          'DBUIToggle',
          'DBUIAddConnection',
          'DBUIFindBuffer',
        },
        init = function()
          -- Your DBUI configuration
          vim.g.db_ui_use_nerd_fonts = 1
        end,
      },
      {
        "saghen/blink.cmp",
        -- tags = 'v0.8.*',
        version = "v1.3.*", -- Releases has prebuilt binaries for fuzzy finding
        opts = {
          keymap = {
            preset = 'default',
            ['<C-n>'] = { 'select_next' },
            ['<C-p>'] = { 'select_prev' },
            ['<C-b>'] = { 'scroll_documentation_up' },
            ['<C-f>'] = { 'scroll_documentation_down' },
          },

          completion = {
            accept = { auto_brackets = { enabled = true } },
            -- ghost_text = { enabled = true },
            menu = { border = 'rounded' },
            documentation = { window = { border = 'rounded' } }
          },

          signature = {
            enabled = true,
            window = { border = 'rounded' }
          },
          sources = {
            default = { "lsp", "path", "snippets", "buffer", "dadbod" },
            per_filetype = { 'snippets', 'dadbod', 'buffer' },
            -- add vim-dadbod-completion to your completion providers
            providers = {
              dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            },
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
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig['lua_ls'].setup({ capabilities = capabilities })
    end
  },
}
