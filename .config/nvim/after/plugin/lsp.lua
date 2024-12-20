local lsp = require('lsp-zero').preset({ 'recommended' })

-- -- lsp to be installed
lsp.ensure_installed({
  'ts_ls',
  'html',
  'cssls',
  'jsonls',
  'emmet_ls',
  'lua_ls',
  'gopls',
  'tailwindcss',
  'htmx', -- curl https://sh.rustup.rs -sSf | sh
  'asm_lsp',
})

-- -- Mason and lspconfig related config
lsp.setup()
require("mason").setup({})
require("mason-lspconfig").setup({})

local lspconfig = require("lspconfig")
lspconfig.html.setup {}
lspconfig.emmet_ls.setup({
  -- If '!' does not trigger snippet in html, go to '~/.local/share/nvim/mason/bin/emmet-ls'
  -- file and add the character in 'triggerCharacters' variable
})
lspconfig.tailwindcss.setup {}
lspconfig.htmx.setup {}

-- -- Keymappings related to LSP
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})
-- learn more here -> :h ins-completion

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  -- local opts = { buffer = bufnr, remap = false }

  local function opts(descValue)
    return { buffer = bufnr, remap = false, desc = descValue }
  end

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts("Go to definition"))
  vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts("Hover"))
  vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts("Go to References"))
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("Rename"))
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
    -- vim.cmd("normal! ggVG=")
  end, opts("Format"))
  vim.keymap.set("n", "<left>", function() vim.diagnostic.goto_prev() end, opts("Prev diagnostic"))
  vim.keymap.set("n", "<right>", function() vim.diagnostic.goto_next() end, opts("Next diagnostic"))
  -- vim.keymap.set("n","<left>",":lprevious<CR>")
  -- vim.keymap.set("n","<right>",":lnext<CR>")
  -- vim.keymap.set("", "", function() vim. end, opts)
end)

--[[
 NOTE: Autocompletion
{'hrsh7th/nvim-cmp'},     -- Required
{'hrsh7th/cmp-nvim-lsp'}, -- Required
{'hrsh7th/cmp-buffer'},
{'hrsh7th/cmp-path'},
{'hrsh7th/cmp-nvim-lua'},
{'L3MON4D3/LuaSnip'},     -- Required
{ "rafamadriz/friendly-snippets" }
{ 'saadparwaiz1/cmp_luasnip' }, -- Required
]]

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer',  keyword_length = 5 },
  }),
  experimental = {
    ghost_text = true,
  }
})
